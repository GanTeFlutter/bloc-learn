import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_event.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_state.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/home/basekt_detail.dart';

class BasketMarketEkrani extends StatefulWidget {
  const BasketMarketEkrani({super.key});

  @override
  State<BasketMarketEkrani> createState() => _BasketMarketEkraniState();
}

class _BasketMarketEkraniState extends State<BasketMarketEkrani> {
  @override
  Widget build(BuildContext context) {
    debugPrint('--BasketMarketEkrani build');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('BasketMarketEkrani'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocListener<BasketappBloc, BasketappState>(
              listener: (context, state) {
                if (state is BasketListEmit) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Sepetinizde ${state.basketList.length} ürün bulunmaktadır.'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: BlocBuilder<BasketappBloc, BasketappState>(
                builder: (context, state) {
                  debugPrint('--BasketMarketEkrani BlocBuilder');
                  if (state is BasketappInitial) {
                    return const Text('');
                  } else if (state is BasketListLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is BasketState) {
                    if (state.basketList.isEmpty) {
                      return const Text('Sepetinizde ürün bulunmamaktadır.');
                    }
                    return SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: state.basketList.length,
                        itemBuilder: (context, index) {
                          final item = state.basketList[index];
                          return Card(
                            color: Colors.grey.shade200,
                            child: ListTile(
                              title: Text(item.name),
                              subtitle: Text('${item.price} ₺'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BasektDetail(basketModel: item),
                                  ),
                                );
                              },
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    const Text('Adet: 1'),
                                    const Spacer(),
                                    IconButton(
                                      icon: const Icon(Icons.delete, color: Colors.red),
                                      onPressed: () {
                                        context.read<BasketappBloc>().add(
                                              RemoveBasket(coffeeModel: item),
                                            );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is BasketappError) {
                    return Text('Hata: ${state.message}');
                  } else {
                    return const Text('Bilinmeyen bir durum oluştu!');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
/**switch bloc kullanimi 
 *  BlocBuilder<BasketappBloc, BasketappState>(
              builder: (context, state) {
                return switch (state) {
                  BasketappInitial() => const Text(''),
                  BasketListLoading() => const CircularProgressIndicator(),
                  BasketListEmit() => state.basketList.isEmpty
                      ? const Text('Sepetinizde ürün bulunmamaktadır.')
                      : SizedBox(
                          height: 500,
                          child: ListView.builder(
                            itemCount: state.basketList.length,
                            itemBuilder: (context, index) {
                              final item = state.basketList[index];
                              return Card(
                                color: Colors.grey.shade200,
                                child: ListTile(
                                  title: Text(item.name),
                                  subtitle: Text('${item.price} ₺'),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BasektDetail(basketModel: item),
                                      ),
                                    );
                                  },
                                  trailing: SizedBox(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        const Text('Adet: 1'),
                                        const Spacer(),
                                        IconButton(
                                          icon: const Icon(Icons.delete, color: Colors.red),
                                          onPressed: () {
                                            context.read<BasketappBloc>().add(
                                                  RemoveBasket(coffeeModel: item),
                                                );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                  BasketappError() => Text('Hata: ${state.message}'),
                  _ => const Text('Bilinmeyen bir durum oluştu!'),
                };
              },
            ),
 */
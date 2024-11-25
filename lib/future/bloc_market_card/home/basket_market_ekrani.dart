import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/future/bloc_market_card/bloc/basketapp_bloc.dart';

class BasketMarketEkrani extends StatefulWidget {
  const BasketMarketEkrani({super.key});

  @override
  State<BasketMarketEkrani> createState() => _BasketMarketEkraniState();
}

class _BasketMarketEkraniState extends State<BasketMarketEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketMarketEkrani'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<BasketappBloc, BasketappState>(
              builder: (context, state) {
                if (state is BasketappLoaded) {
                  return SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: state.basketList.length,
                      itemBuilder: (context, index) {
                        final coffee = state.basketList[index];
                        return ListTile(
                          title: Text(coffee.name),
                          subtitle: Text('\$${coffee.price}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle),
                            onPressed: () {
                              // Sepetten ürünü çıkar
                              context.read<BasketappBloc>().add(RemoveBasket(coffee));
                            },
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is BasketappInitial) {
                  return const Center(child: Text('Sepet boş'));
                } else {
                  return const Center(child: Text('Bir hata oluştu.'));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

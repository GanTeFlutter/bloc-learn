import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_event.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_state.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/home/basket_market_ekrani.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/home/homeModel/basket_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BasketViewModel {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BasketappBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        actions: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BasketMarketEkrani(),
                        ));
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
              ),
              Positioned(
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: BlocConsumer<BasketappBloc, BasketappState>(
                    listener: (context, state) {
                      if (state is BasketState && ModalRoute.of(context)?.isCurrent == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Ürün sepete eklendi'),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is BasketState) {
                        return Text(
                          state.toplamAdet.toString(),
                          style: const TextStyle(color: Colors.white),
                        );
                      }
                      return const Text('0');
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: coffeeList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(coffeeList[index].name),
                  subtitle: Text(coffeeList[index].description),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        Text(coffeeList[index].price.toString()),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              bloc.add(HomeAddBasket(coffeeModel: coffeeList[index], quantity: 1));
                              debugPrint('--HomeView--IconButton--Sepete eklendi');
                            },
                            icon: const Icon(Icons.shopping_cart_checkout_outlined)),
                      ],
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => BasektDetail(
                    //       basketModel: coffeeList[index],
                    //     ),
                    //   ),
                    // );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

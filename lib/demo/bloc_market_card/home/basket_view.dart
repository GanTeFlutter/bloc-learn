import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_event.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_state.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/home/basket_market_ekrani.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/home/homeModel/basket_view_model.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends BasketViewModel {
  @override
  Widget build(BuildContext context) {
    final blocinstance = context.read<BasketappBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketView'),
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
                  child: BlocBuilder<BasketappBloc, BasketappState>(
                    builder: (context, state) {
                      if (state is BasketState) {
                        return Text(state.basketList.length.toString(),
                            style: const TextStyle(color: Colors.white));
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
                              blocinstance.add(AddBasket(coffeeModel: coffeeList[index]));
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

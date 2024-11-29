import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/basket_item_model.dart';
import 'package:flutter_bloc_learn/deneme/denem_view_model.dart';

class DenenemView extends StatefulWidget {
  const DenenemView({super.key});

  @override
  State<DenenemView> createState() => _DenenemViewState();
}

class _DenenemViewState extends DenemeViewModel {
  final List<BasketItemModel> newBasketList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Basket List'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: basketItemModel.length,
                itemBuilder: (context, index) {
                  var basketItem = basketItemModel[index];
                  return ListTile(
                    title: Text(basketItem.coffeeModel.price.toString()),
                    subtitle: Text(basketItem.coffeeModel.id.toString()),
                    trailing: Text('Quantity: ${basketItem.quantity}'),
                    leading: Text('Total Price: ${basketItem.totalPrice}'),
                    onTap: () {
                      setState(() {
                        basketItem.quantity++;
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: ListView.builder(
                itemCount: newBasketList.length,
                itemBuilder: (context, index) {
                  var basketItem = newBasketList[index];
                  return newBasketList.isEmpty
                      ? const Center(child: Text('No item in the basket'))
                      : ListTile(
                          title: Text(basketItem.coffeeModel.name),
                          subtitle: Text(basketItem.coffeeModel.id.toString()),
                          trailing: Text('Quantity: ${basketItem.quantity}'),
                          onTap: () {
                            setState(() {
                              newBasketList.removeAt(index);
                            });
                          },
                        );
                },
              ),
            )
          ],
        ));
  }
}

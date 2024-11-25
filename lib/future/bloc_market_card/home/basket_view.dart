import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/future/bloc_market_card/bloc/basketapp_bloc.dart';
import 'package:flutter_bloc_learn/future/bloc_market_card/home/basekt_detail.dart';
import 'package:flutter_bloc_learn/future/bloc_market_card/home/basket_market_ekrani.dart';

class CoffeeScreen extends StatelessWidget {
  final List<CoffeeModel> coffeeList = [
    CoffeeModel(name: 'Espresso', description: 'Rich and strong', price: 3.99),
    CoffeeModel(name: 'Latte', description: 'Smooth and creamy', price: 4.49),
    CoffeeModel(name: 'Cappuccino', description: 'Foamy delight', price: 4.99),
    CoffeeModel(name: 'Americano', description: 'Classic and bold', price: 3.49),
  ];

  CoffeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _blocinstance = context.read<BasketappBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Shop'),
        backgroundColor: Colors.brown[700],
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BasketMarketEkrani()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: coffeeList.length,
              itemBuilder: (context, index) {
                final coffee = coffeeList[index];
                return Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BasektDetail(
                                        basketModel: coffee,
                                      )),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/kaydirak.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              coffee.name,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text('\$${coffee.price.toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: BlocListener<BasketappBloc, BasketappState>(
                          listener: (context, state) {
                            if (state is BasketappState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Added to basket'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                          child: IconButton(
                            icon: const Icon(Icons.shopping_cart),
                            onPressed: () {
                              _blocinstance.add(AddBasket(coffee));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                const Icon(Icons.shopping_cart_outlined, size: 60),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.brown[700],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      '0',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CoffeeModel {
  final String name;
  final String description;
  final double price;

  CoffeeModel({
    required this.name,
    required this.description,
    required this.price,
  });
}

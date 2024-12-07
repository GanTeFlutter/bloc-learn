import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/101/demo2/basicbasket/basicbasket_cubit.dart';
import 'package:flutter_bloc_learn/101/demo2/model/cars_mod.dart';

class BasicHomeView extends StatefulWidget {
  const BasicHomeView({super.key});

  @override
  State<BasicHomeView> createState() => _BasicHomeViewState();
}

class _BasicHomeViewState extends State<BasicHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepet Uygulaması'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Yeni ürün eklemek için Cubit'e çağrı
          const sampleCar = Car(
            id: "1",
            brand: "BMW",
            model: "X5",
            price: 100000,
            stock: 5,
          );
          context.read<CarCartCubit>().addItem(sampleCar, 1);
        },
        tooltip: "Ürün Ekle",
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sepet durumu için BlocBuilder
            BlocBuilder<CarCartCubit, CarCart>(
              builder: (context, state) {
                if (state.items.isEmpty) {
                  return const Text(
                    "Sepetiniz boş!",
                    style: TextStyle(fontSize: 20),
                  );
                }

                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.items.length,
                          itemBuilder: (context, index) {
                            final item = state.items[index];
                            return ListTile(
                              leading: CircleAvatar(
                                child: Text(item.quantity.toString()),
                              ),
                              title:
                                  Text("${item.car.brand} ${item.car.model}"),
                              subtitle:
                                  Text("${item.car.price}₺ x ${item.quantity}"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      context
                                          .read<CarCartCubit>()
                                          .decreaseQuantity(item.car.id);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      context
                                          .read<CarCartCubit>()
                                          .increaseQuantity(item.car.id);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    color: Colors.red,
                                    onPressed: () {
                                      context
                                          .read<CarCartCubit>()
                                          .removeItem(item.car.id);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Toplam Tutar: ${state.totalPrice.toStringAsFixed(2)}₺",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

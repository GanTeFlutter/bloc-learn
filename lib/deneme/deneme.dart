import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/deneme/denem_view_model.dart';

class DenenemView extends StatefulWidget {
  const DenenemView({super.key});

  @override
  State<DenenemView> createState() => _DenenemViewState();
}

class _DenenemViewState extends DenemeViewModel {
 
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text('Basket List'),
      ),
      body: ListView.builder(
        itemCount: basketModelBlocList.length,
        itemBuilder: (context, index) {
          final basket = basketModelBlocList[index];
          final totalPrice = basket.totalPrice;
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sepet Başlığı
                  Text(
                    'Basket ${index + 1}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),

                  // Sepet Ürünlerini Listele
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: basket.items.length,
                    itemBuilder: (context, itemIndex) {
                      final item = basket.items[itemIndex];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${item.coffeeModel.name} (x${item.quantity})'),
                            Text('${item.totalPrice.toStringAsFixed(2)} ₺'),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  // Toplam Fiyat
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Total: ${totalPrice.toStringAsFixed(2)} ₺',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

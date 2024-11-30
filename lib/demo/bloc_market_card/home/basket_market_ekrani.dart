import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_state.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/home/basekt_detail.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/coffe_model.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/widget/custom_show_dialog.dart';

class BasketMarketEkrani extends StatefulWidget {
  const BasketMarketEkrani({super.key});

  @override
  State<BasketMarketEkrani> createState() => _BasketMarketEkraniState();
}

class _BasketMarketEkraniState extends State<BasketMarketEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('BasketMarketEkrani'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<BasketappBloc, BasketappState>(
              builder: (context, state) {
                return switch (state) {
                  BasketInitial() => const Text(
                      'Herhangi bir emit islemi gerceklesmedi veya cubit baslangic durumunda'),
                  BasketLoading() => const CircularProgressIndicator(),
                  BasketState() => state.stateBasketModel.items.isEmpty
                      ? const Text('Sepetinizde ürün bulunmamaktadır.')
                      : SizedBox(
                          height: 500,
                          child: ListView.builder(
                            itemCount: state.stateBasketModel.items.length,
                            itemBuilder: (context, index) {
                              //burda Bloc ta state kısmında BasketState içesinde yayınlanacak statetin ismini stateBasketModel
                              // yapmıştık ve bu stateBasketModel içindeki items listesinden indexe göre elemanları alıyoruz
                              final item = state.stateBasketModel.items[index].coffeeModel;

                              return basketCard(item, context, state, index);
                            },
                          ),
                        ),
                  BasketappError() => Text('Hata: ${state.errorMessage}'),
                  _ => const Text('Bilinmeyen bir durum oluştu! Lütfen tekrar deneyiniz.'),
                };
              },
            ),
            const Spacer(),
            _satinAlma(context, 0.0),
          ],
        ),
      ),
    );
  }

  Card basketCard(CoffeeModel item, BuildContext context, BasketState state, int index) {
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
                                      Text('Adet: ${state.stateBasketModel.items[index].miktar}'),
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
  }

  Container _satinAlma(BuildContext context, double totalPrice) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Ürün Miktarı'),
                BlocBuilder<BasketappBloc, BasketappState>(
                  builder: (context, state) {
                    if (state is BasketState) {
                      final item = state.toplamAdet;

                      return Text(
                        '$item',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.brown, fontWeight: FontWeight.bold),
                      );
                    } else {
                      return const Text('0 ₺');
                    }
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Toplam Fiyat'),
                BlocBuilder<BasketappBloc, BasketappState>(
                  builder: (context, state) {
                    if (state is BasketState) {
                      final item = state.toplamFiyat;

                      return Text(
                        '$item₺',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.brown, fontWeight: FontWeight.bold),
                      );
                    } else {
                      return const Text('0 ₺');
                    }
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const CustomShowDialog(
                  title: 'Herşey Hazır :)',
                  aciklama: 'Siparişinizi tamamlamak istiyor musunuz?',
                  disableText: 'Düzenle',
                  enableText: 'Tamamla',
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Siparişi Tamamla',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ));
  }
}




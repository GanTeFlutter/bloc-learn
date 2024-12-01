import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_event.dart';
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
      body: BlocBuilder<BasketappBloc, BasketappState>(
        builder: (context, state) {
          return switch (state) {
            BasketInitial() =>
              const Text('Herhangi bir emit islemi gerceklesmedi,cubit baslangic durumunda'),
            BasketLoading() => const CircularProgressIndicator(),
            BasketState() => state.stateBasketModel.items.isEmpty
                ? const Text('Sepetinizde ürün bulunmamaktadır.')
                : Column(
                    children: [
                      urunler(state),
                      const Spacer(),
                      _satinAlma(context, state.toplamFiyat),
                    ],
                  ),
            BasketappError() => Text('Hata: ${state.errorMessage}'),
            _ => const Text('Bilinmeyen bir durum oluştu! Lütfen tekrar deneyiniz.'),
          };
        },
      ),
    );
  }

  SizedBox urunler(BasketState state) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: state.stateBasketModel.items.length,
        itemBuilder: (context, index) {
          final item = state.stateBasketModel.items[index].coffeeModel;
          return basketCard(item, context, state, index);
        },
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
          width: 200,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    context
                        .read<BasketappBloc>()
                        .add(HomeAddBasket(quantity: 1, coffeeModel: item));
                  },
                  icon: const Icon(Icons.add)),
              Text('Adet: ${state.stateBasketModel.items[index].miktar}'),
              IconButton(
                  onPressed: () {
                    debugPrint('--IconButton--Silme işlemi gerçekleşti');
                    context
                        .read<BasketappBloc>()
                        .add(DecreaseBasket(quantity: 1, coffeeModel: item));
                  },
                  icon: const Icon(Icons.remove)),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  context.read<BasketappBloc>().add(RemoveBasket(coffeeModel: item));
                },
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
                    return Text(
                      state is BasketState ? '${state.toplamAdet}' : '0 ₺',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.brown, fontWeight: FontWeight.bold),
                    );
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
                    return Text(
                      state is BasketState ? '${state.toplamFiyat}₺' : '0 ₺',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.brown, fontWeight: FontWeight.bold),
                    );
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

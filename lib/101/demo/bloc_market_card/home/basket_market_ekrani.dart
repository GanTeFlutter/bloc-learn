import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/bloc/basketapp_bloc.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/bloc/basketapp_event.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/bloc/basketapp_state.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/home/basekt_detail.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/widget/custom_show_dialog.dart';



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
            // BlocConsumer<BasketappBloc, BasketappState>(
            //   listener: (context, state) {
            //     if (state is BasketState && ModalRoute.of(context)?.isCurrent == true) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text(''),
            //           duration: const Duration(seconds: 2),
            //         ),
            //       );
            //     }
            //   },
            //   builder: (context, state) {
            //     debugPrint('--BasketMarketEkrani BlocConsumer');
            //     if (state is BasketappInitial) {
            //       return const Text('');
            //     } else if (state is BasketListLoading) {
            //       return const CircularProgressIndicator();
            //     } else if (state is BasketState) {
            //       if (state.basketList.isEmpty) {
            //         return const Text('Sepetinizde ürün bulunmamaktadır.');
            //       }
            //       return SizedBox(
            //         height: 500,
            //         child: ListView.builder(
            //           itemCount: state.basketList.length,
            //           itemBuilder: (context, index) {
            //             final item = state.basketList[index];
            //             return Card(
            //               color: Colors.grey.shade200,
            //               child: ListTile(
            //                 title: Text(item.name),
            //                 subtitle: Text('${item.price} ₺'),
            //                 onTap: () {
            //                   Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                       builder: (context) => BasektDetail(basketModel: item),
            //                     ),
            //                   );
            //                 },
            //                 trailing: SizedBox(
            //                   width: 100,
            //                   child: Row(
            //                     children: [
            //                       const Text('Adet: 1'),
            //                       const Spacer(),
            //                       IconButton(
            //                         icon: const Icon(Icons.delete, color: Colors.red),
            //                         onPressed: () {
            //                           context.read<BasketappBloc>().add(
            //                                 RemoveBasket(coffeeModel: item),
            //                               );
            //                         },
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       );
            //     } else if (state is BasketappError) {
            //       return Text(state.message);
            //     } else {
            //       return const Text('Bilinmeyen bir durum oluştu!');
            //     }
            //   },
            // ),
            const Spacer(),
            // BlocBuilder<BasketappBloc, BasketappState>(
            //   builder: (context, state) {
            //     if (state is BasketState) {
            //       return _satinAlma(context, state.totalPrice);
            //     }
            //     return const Text('');
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  // Container _satinAlma(BuildContext context, double totalPrice) {
  //   return Container(
  //       height: MediaQuery.of(context).size.height * 0.1,
  //       width: double.infinity,
  //       decoration: BoxDecoration(
  //         color: Colors.grey.shade200,
  //         borderRadius: const BorderRadius.only(
  //           topLeft: Radius.circular(20),
  //           topRight: Radius.circular(20),
  //         ),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               const Text('Total Price'),
  //               BlocBuilder<BasketappBloc, BasketappState>(
  //                 builder: (context, state) {
  //                   return Text(
  //                     state is BasketState ? '${state.totalPrice} ₺' : '0 ₺',
  //                     style: Theme.of(context)
  //                         .textTheme
  //                         .titleMedium
  //                         ?.copyWith(color: Colors.brown, fontWeight: FontWeight.bold),
  //                   );
  //                 },
  //               )
  //             ],
  //           ),
  //           ElevatedButton(
  //             onPressed: () => showDialog(
  //               context: context,
  //               builder: (context) => const CustomShowDialog(
  //                 title: 'Herşey Hazır :)',
  //                 aciklama: 'Siparişinizi tamamlamak istiyor musunuz?',
  //                 disableText: 'Düzenle',
  //                 enableText: 'Tamamla',
  //               ),
  //             ),
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.brown,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(20),
  //               ),
  //             ),
  //             child: Text(
  //               'Complete Order',
  //               style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
  //             ),
  //           ),
  //         ],
  //       ));
  // }
}




/**
 silinen ürünü geri alma işlemi eklenecek 
   ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('XXXXX Ürün silindi!'),
                            backgroundColor: Colors.green, // Arka plan rengini yeşil yap
                            action: SnackBarAction(
                              label: 'Geri Al',
                              onPressed: () {
                                // İşlem geri alındığında yapılacaklar
                              },
                            ),
                            duration: const Duration(seconds: 3),
                          ),
                        );


kullanım bu şekilde sadeleştirilecek 
 * switch bloc kullanimi 
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
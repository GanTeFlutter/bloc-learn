import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/bloc/home_category_bloc.dart';
import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/home/home_page_view_model.dart';
import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/model/coffee_katagori.dart';
import 'package:flutter_bloc_learn/product/enum/e.firebase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    final blocService = BlocProvider.of<HomeCategoryBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(FirebaseDocumentName.ebk.name),
        ),
        body: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    debugPrint('--ebk-home');
                    blocService
                        .add(HomeCategoryFetchCoffee(categoryName: FirebaseDocumentName.ebk.name));
                  },
                  child: const Text('EBK'),
                ),
                ElevatedButton(
                  onPressed: () {
                    debugPrint('--sk-home');
                    blocService
                        .add(HomeCategoryFetchCoffee(categoryName: FirebaseDocumentName.sk.name));
                  },
                  child: const Text('SK'),
                ),
                ElevatedButton(
                  onPressed: () {
                    debugPrint('--stk-home');
                    blocService.add(HomeCategoryFetchCoffee(categoryName: FirebaseDocumentName.stk.name));
                  },
                  child: const Text('STK'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: GridView.builder(
                itemCount: 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return BlocBuilder<HomeCategoryBloc, HomeCategoryState>(
                    builder: (context, state) {
                      if (state is CategoryInitial) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is CoffeeKategoryState) {
                        return HomeCoffeeCard(coffeeKatagori: state.coffeStateK);
                      } else if (state is CategoryError) {
                        return Center(
                          child: Text(state.message),
                        );
                      } else {
                        return const Center(
                          child: Text('Error-HomePage-'),
                        );
                      }
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}

class HomeCoffeeCard extends StatelessWidget {
  final CoffeeKatagori coffeeKatagori;
  const HomeCoffeeCard({
    super.key,
    required this.coffeeKatagori,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _image(),
          Text(
            coffeeKatagori.coffeeList[0].name.toString(),
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Container _image() {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://picsum.photos/200?random=${DateTime.now().millisecondsSinceEpoch}'),
        ),
      ),
      height: 150,
    );
  }
}

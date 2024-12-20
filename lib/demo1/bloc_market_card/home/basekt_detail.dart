import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/demo1/bloc_market_card/model/coffe_mod.dart';

class BasektDetail extends StatefulWidget {
  final CoffeeModel basketModel;
  const BasektDetail({super.key, required this.basketModel});

  @override
  State<BasektDetail> createState() => _BasektDetailState();
}

class _BasektDetailState extends State<BasektDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.basketModel.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}

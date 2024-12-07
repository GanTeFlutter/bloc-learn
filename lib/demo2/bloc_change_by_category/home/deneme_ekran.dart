import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/mixin/firebase_mixin.dart';

class DenemeEkran extends StatefulWidget {
  const DenemeEkran({super.key});

  @override
  State<DenemeEkran> createState() => _DenemeEkranState();
}

class _DenemeEkranState extends State<DenemeEkran> with FirebaseMixin {
  @override
  void initState() {
    super.initState();
    initFirebaseMixin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DenemeEkran'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getFirebaseDataMix,
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

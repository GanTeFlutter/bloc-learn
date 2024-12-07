import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/home/deneme_ekran.dart';
import 'package:flutter_bloc_learn/product/init/app_initialize.dart';
import 'package:flutter_bloc_learn/product/init/state_initialize.dart';
//Main dosyamız temiz olsun diye AppInitialize ve StateInitialize sınıflarını oluşturduk.
//BlocProvider ve MultiBlocProvider kullanımını StateInitialize sınıfında görebilirsiniz.
//AppInitialize sınıfında ise uygulama başlatılırken yapılacak işlemler yer alıyor.

Future<void> main() async {
  await AppInitialize().make();
  runApp(const StateInitialize(child: _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const DenemeEkran(),
    );
  }
}

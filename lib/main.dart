import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/future/bloc_selector_learn.dart/user_view.dart';
import 'package:flutter_bloc_learn/product/init/app_initialize.dart';
import 'package:flutter_bloc_learn/product/init/state_initialize.dart';

//Main dosyamız temiz olsun diye AppInitialize ve StateInitialize sınıflarını oluşturduk.
//BlocProvider ve MultiBlocProvider kullanımını StateInitialize sınıfında görebilirsiniz.
Future<void> main() async {
  await AppInitialize().make();
  runApp(const StateInitialize(child: _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserProfilePage(),
    );
  }
}

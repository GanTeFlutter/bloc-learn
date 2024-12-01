import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/home/home_view.dart';
import 'package:flutter_bloc_learn/product/init/app_initialize.dart';
import 'package:flutter_bloc_learn/product/init/state_initialize.dart';
import 'package:lottie/lottie.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lottie/lottieee.json'),
      ),
    );
  }
}

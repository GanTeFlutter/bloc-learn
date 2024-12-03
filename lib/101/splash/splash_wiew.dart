import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/demo1/bloc_market_card/home/home_view.dart';
import 'package:lottie/lottie.dart';

class SplashWiew extends StatefulWidget {
  const SplashWiew({super.key});

  @override
  State<SplashWiew> createState() => _SplashWiewState();
}

class _SplashWiewState extends State<SplashWiew> {
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

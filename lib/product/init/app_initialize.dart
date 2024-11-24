import 'dart:async';
import 'package:flutter/material.dart';

final class AppInitialize {
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  // Future<void> _initialize() async {}
}

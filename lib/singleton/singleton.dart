import 'package:flutter/material.dart';

class Singleton {
  static Singleton _instance;

  Singleton._internal();

  static Singleton getInstance() {
    return _instance ?? Singleton._internal();
  }
}

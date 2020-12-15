//Creational Pattern

import 'package:flutter/material.dart';

class Singleton {
  static Singleton _instance = Singleton._internal();

  Singleton._internal();

  factory Singleton() {
    return _instance;
  }
}

import 'package:flutter/material.dart';

abstract class ExampleStateBase {
  final String _initialText =
      "A new 'ExampleStateByDefinition' instance has been created.";
  String _stateText;

  String get currentText => _stateText;

  void setStateText(String text) {
    _stateText = text;
  }

  void reset() {
    _stateText = _initialText;
  }
}

//Singleton class that implements Singleton Design Pattern
class ExampleStateByDefinition extends ExampleStateBase {
  static ExampleStateByDefinition _instance;

  // This is a way to implement private constructor to make sure that we can't take an object
  // using this way: ExampleStateByDefinition x = ExampleStateByDefinition();
  // and when writing causes a compile time exception.
  ExampleStateByDefinition._internal() {
    _stateText = _initialText;
    print(_stateText);
  }

  static ExampleStateByDefinition getState() {
    if (_instance == null) _instance = ExampleStateByDefinition._internal();
    return _instance;
  }
}

//Singleton Class that implements Singleton Design Pattern in "The Dart Way"
class ExampleState extends ExampleStateBase {
  static final ExampleState _instance = ExampleState._internal();

/*
factory constructor.
It is used to implement a constructor that does not always create a new instance of its class
it returns a value to initialize to the object which i'm trying to implement.
* */
  factory ExampleState() {
    return _instance;
  }

  ExampleState._internal() {
    _stateText = _initialText;
    print(_stateText);
  }
}

/*
* Example of the state without Singleton
* */
class ExampleStateWithoutSingleton extends ExampleStateBase {
  ExampleStateWithoutSingleton() {
    _stateText = _initialText;
    print(_stateText);
  }
}

class Test {
  static void testSingleton() {
    ExampleStateByDefinition object = ExampleStateByDefinition.getState();
    object.setStateText("This is current State");
    ExampleStateByDefinition object2 = ExampleStateByDefinition.getState();
    print(object2.currentText);

    //Dart Way in Singleton Implementation
    ExampleState objectx = ExampleState();
    objectx.setStateText("This is current State in Dart Way");
    ExampleState objectx2 = ExampleState();
    print(objectx2.currentText);

    //Test without using Singleton Class
    ExampleStateWithoutSingleton objectxx = ExampleStateWithoutSingleton();
    objectx.setStateText("This is current State in Dart Way");
    ExampleStateWithoutSingleton objectxx2 = ExampleStateWithoutSingleton();
    print(objectxx2
        .currentText); // returns the initial text as this is a different instance;
  }
}

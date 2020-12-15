//Structural Design Pattern
//Adapter is also called (Wrapper).
/*
* Converts the interface of a class into another interface clients expect.
* Adapter lets classes work together that couldn't otherwise because of incompatible interfaces.
* */

import 'package:different_design_patterns/adapter/contact.dart';

abstract class ContactsAdapter {
  List<Contact> getContacts();
}

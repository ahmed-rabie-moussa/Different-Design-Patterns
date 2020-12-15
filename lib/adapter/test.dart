import 'package:different_design_patterns/adapter/contact.dart';
import 'package:different_design_patterns/adapter/json_contacts_adapter.dart';
import 'package:different_design_patterns/adapter/xml_contacts_adapter.dart';

class Test {
  void getContacts() {
    List<Contact> contacts = [];
    contacts.addAll(JsonContactsAdapter().getContacts());
    contacts.addAll(XmlContactsAdapter().getContacts());
    contacts.forEach((contact) {
      print(contact.fullName);
    });
  }
}

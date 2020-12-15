import 'dart:convert';
import 'package:different_design_patterns/adapter/adapter.dart';
import 'package:different_design_patterns/adapter/contact.dart';
import 'package:different_design_patterns/adapter/json_contacts_api.dart';

class JsonContactsAdapter implements ContactsAdapter {
  //The Api that has the data from network.
  final JsonContactsApi _api = JsonContactsApi();

  @override
  List<Contact> getContacts() {
    //Simulating of fetching data over network.
    String contactsJson = _api.getContactsJson();

    //Now i have a String of JSON result, I want to convert to a list using JSON Parser.
    List<Contact> contactsList = _parseContactsJson(contactsJson);

    return contactsList;
  }

  List<Contact> _parseContactsJson(String contactsJson) {
    var contactsMap = json.decode(contactsJson) as Map<String, dynamic>;
    var contactsJsonList = contactsMap['contacts'] as List;
    var contactsList = contactsJsonList
        .map((json) => Contact(
              fullName: json['fullName'],
              email: json['email'],
              favorite: json['favorite'],
            ))
        .toList();

    return contactsList;
  }
}

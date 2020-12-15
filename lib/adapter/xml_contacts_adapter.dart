import 'package:different_design_patterns/adapter/contact.dart';
import 'package:different_design_patterns/adapter/xml_contacts_api.dart';
import 'package:xml/xml.dart' as xml;
import 'adapter.dart';

class XmlContactsAdapter implements ContactsAdapter {
  //The Api that has the data from network.
  final XmlContactsApi _api = XmlContactsApi();

  @override
  List<Contact> getContacts() {
    //Simulating of fetching data over network.
    String contactsXml = _api.getContactsXml();

    //Now i have a String of XML result, I want to convert to a list using XML Parser.
    List<Contact> contactsList = _parseContactsXml(contactsXml);

    return contactsList;
  }

  List<Contact> _parseContactsXml(String contactsXml) {
    var xmlDocument = xml.parse(contactsXml);
    var contactsList = List<Contact>();

    for (var xmlElement in xmlDocument.findAllElements('contact')) {
      String fullName = xmlElement.findElements('fullname').single.text;
      String email = xmlElement.findElements('email').single.text;
      String favouriteString = xmlElement.findElements('favorite').single.text;
      bool favorite = favouriteString.toLowerCase() == 'true';

      contactsList.add(Contact(
        fullName: fullName,
        email: email,
        favorite: favorite,
      ));
    }

    return contactsList;
  }
}

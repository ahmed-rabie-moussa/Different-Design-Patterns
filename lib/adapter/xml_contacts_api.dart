/*
* This Class simulates the data returned from an API with XML Contacts list
* */

class XmlContactsApi {
  final String _contactsXml = '''
  <?xml version="1.0"?>
  <contacts>
    <contact>
      <fullname>Ahmed Rabie (XML)</fullname>
      <email>ahmed.rabie.moussa@xml.com</email>
      <favorite>false</favorite>
    </contact>
    <contact>
      <fullname>Eslam Rabie (XML)</fullname>
      <email>eslamrabie@xml.com</email>
      <favorite>true</favorite>
    </contact>
    <contact>
      <fullname>ali rabie (XML)</fullname>
      <email>ali@xml.com</email>
      <favorite>true</favorite>
    </contact>
  </contacts>
  ''';

  String getContactsXml() {
    return _contactsXml;
  }
}

/*
* This Class simulates the data returned from an API with Json Contacts list
* */

class JsonContactsApi {
  final String _contactsJson = '''
  {
  "contacts" : [
  {
  "fullName" : "Ahmed Rabie (JSON)",
  "email" : "ahmed.rabie.moussa@gmail.com",
  "favorite" : true
  },
    {
  "fullName" : "Eslam Rabie (JSON)",
  "email" : "eslam.rabie.moussa@gmail.com",
  "favorite" : true
  },
    {
  "fullName" : "Ahmed Ahmed (JSON)",
  "email" : "ahmed.ahmed.moussa@gmail.com",
  "favorite" : false
  }
  ]
  }
  ''';

  String getContactsJson() {
    return _contactsJson;
  }
}

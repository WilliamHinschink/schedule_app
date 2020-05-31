import 'dart:convert';

import 'package:meta/meta.dart';

class Contact {
  final String avatar;
  final String name;
  final String email;
  final String location;

  Contact({
    @required this.avatar,
    @required this.name,
    @required this.email,
    @required this.location
  });

  static List<Contact> allFromResponse(response) {
    var decodedJson = json.decode(response).cast<String, dynamic>();

    return decodedJson['results']
        .cast<Map<String, dynamic>>()
        .map((obj) => Contact.fromMap(obj))
        .toList()
        .cast<Contact>();
  }

  static fromMap(map) {
    var name = map['name'];

    return Contact(
        avatar: map['picture']['large'],
        name: '${_capitalize(name['first'])} ${_capitalize(name['last'])}',
        email: map['email'],
        location: _capitalize(map['location']['state']));
  }

  static _capitalize(String input) {
    return input.substring(0, 1).toUpperCase() + input.substring(1);
  }
}

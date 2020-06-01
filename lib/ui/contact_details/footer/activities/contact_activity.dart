import 'dart:convert';

import 'package:intl/intl.dart';

class ContactActivity {
  final String name;
  final String description;
  final String created_at;

  ContactActivity(this.name, {this.description, this.created_at});

  static List<ContactActivity> allFromResponse(response) {
    var decodedJson = json.decode(response).cast<List<dynamic>>();

    return decodedJson
        .cast<Map<String, dynamic>>()
        .map((obj) => ContactActivity.fromMap(obj))
        .toList()
        .cast<ContactActivity>();
  }

  static fromMap(map) {
    var name = map['name'];
    return ContactActivity(name,
        description: map['description'], created_at: _formatDate(map['created_at']));
  }

  static _formatDate(String input) {
    var date = DateTime.parse(input);
    var formatter = DateFormat.yMd('pt_BR');
    return formatter.format(date);
  }
}

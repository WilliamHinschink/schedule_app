import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/ui/contact_details/body/contact_detail_body.dart';
import 'package:scheduleapp/ui/contact_details/header/contact_detail_header.dart';
import 'package:scheduleapp/ui/contacts/contact.dart';
import 'package:meta/meta.dart';

class ContactDetailsPage extends StatefulWidget {
  const ContactDetailsPage({Key key, this.contact, @required this.avatarTag})
      : super(key: key);

  final Contact contact;
  final Object avatarTag;

  @override
  _ContactDetailsPageState createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = BoxDecoration(
      gradient: LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: <Color>[
          Color(0xFF413070),
          Color(0xFF2B264A),
        ],
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: linearGradient,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ContactDetailHeader(
                contact: widget.contact,
                avatarTag: widget.avatarTag,
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: ContactDetailBody(contact: widget.contact),
              ),
              //ContactActivities()
            ],
          ),
        ),
      ),
    );
  }
}

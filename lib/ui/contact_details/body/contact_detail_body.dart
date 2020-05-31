import 'package:flutter/material.dart';
import 'package:scheduleapp/ui/contacts/contact.dart';

class ContactDetailBody extends StatelessWidget {
  final Contact contact;

  const ContactDetailBody({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          contact.name,
          style: textTheme.headline.copyWith(color: Colors.white),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: _buildLocationInfo(textTheme),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text(
            'Here your description',
            style:
                textTheme.body1.copyWith(color: Colors.white70, fontSize: 16.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Row(
            children: <Widget>[
              _createCircleBadge(Icons.beach_access, theme.accentColor),
              _createCircleBadge(Icons.cloud, Colors.white12),
              _createCircleBadge(Icons.shop, Colors.white12),
            ],
          ),
        ),
      ],
    );
  }

  _buildLocationInfo(TextTheme textTheme) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.place,
          color: Colors.white,
          size: 16.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            contact.location,
            style: textTheme.subhead.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }

  _createCircleBadge(IconData iconData, Color color) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: CircleAvatar(
        backgroundColor: color,
        child: Icon(
          iconData,
          color: Colors.white,
          size: 16.0,
        ),
        radius: 16.0,
      ),
    );
  }
}

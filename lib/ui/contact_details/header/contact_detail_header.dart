import 'package:flutter/material.dart';
import 'package:scheduleapp/ui/contact_details/header/diagonally_cut_colored_image.dart';
import 'package:scheduleapp/ui/contacts/contact.dart';
import 'package:meta/meta.dart';

class ContactDetailHeader extends StatelessWidget {
  final Contact contact;
  final Object avatarTag;

  const ContactDetailHeader({Key key, this.contact, @required this.avatarTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Stack(
      children: <Widget>[
        _buildDiagonalImageBackground(context),
        Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.4,
          child: Column(
            children: <Widget>[
              _buildAvatar(),
              _buildFollowerInfo(textTheme),
              _buildActionButton(theme),
            ],
          ),
        ),
        Positioned(
          top: 26.0,
          left: 4.0,
          child: BackButton(
            color: Colors.white,
          ),
        )
      ],
    );
  }

  //Anything is a Widget
  _buildDiagonalImageBackground(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return DiagonallyCutColoredImage(
      color: Color(0xBB8338f4),
    );
  }

  _buildAvatar() {
    return Hero(
      tag: avatarTag,
      child: CircleAvatar(
        backgroundImage: NetworkImage(contact.avatar),
        radius: 50.0,
      ),
    );
  }

  _buildFollowerInfo(TextTheme textTheme) {
    var followerStyle = textTheme.subhead.copyWith(color: Color(0xBBFFFFFF));

    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '90 Following',
            style: followerStyle,
          ),
          Text(
            ' | ',
            style: followerStyle.copyWith(
                fontSize: 24.0, fontWeight: FontWeight.normal),
          ),
          Text(
            '100 Followers',
            style: followerStyle,
          ),
        ],
      ),
    );
  }

  _buildActionButton(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _createPillButton(
            'HIRE ME',
            backgroundColor: theme.accentColor,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(color: Colors.white30),
            ),
            child: _createPillButton('FOLLOW'),
          ),
        ],
      ),
    );
  }

  _createPillButton(
    String text, {
    Color backgroundColor = Colors.transparent,
    Color textColor = Colors.white70,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: () {},
        minWidth: 140.0,
        color: backgroundColor,
        textColor: textColor,
        child: Text(text),
      ),
    );
  }
}

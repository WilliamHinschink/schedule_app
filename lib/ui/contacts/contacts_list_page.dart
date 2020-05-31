import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scheduleapp/ui/contact_details/contact_details_page.dart';
import 'package:scheduleapp/ui/contacts/contact.dart';

class ContactsListPage extends StatefulWidget {
  @override
  _ContactsListPageState createState() => _ContactsListPageState();

  ContactsListPage({Key key}) : super(key: key);
}

class _ContactsListPageState extends State<ContactsListPage> {
  List<Contact> _contacts = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadContacts();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadContacts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person_add),
        backgroundColor: Colors.red,
      ),
      body: _contacts.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              controller: _scrollController,
              itemCount: _contacts.length,
              itemBuilder: _buildContactListTile),
    );
  }

  Future<void> _loadContacts() async {
    http.Response response =
        await http.get('https://randomuser.me/api/?results=25');

    setState(() {
      _contacts.addAll(Contact.allFromResponse(response.body));
    });
  }

  Widget _buildContactListTile(BuildContext context, int index) {
    var contact = _contacts[index];

    return ListTile(
      onTap: () => _navigateToContactDetails(contact, index),
      leading: Hero(
        tag: index,
        child: CircleAvatar(
          backgroundImage: NetworkImage(contact.avatar),
        ),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.email),
    );
  }

  void _navigateToContactDetails(Contact contact, Object avatarTag) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (c) =>
            ContactDetailsPage(contact: contact, avatarTag: avatarTag),
      ),
    );
  }
}

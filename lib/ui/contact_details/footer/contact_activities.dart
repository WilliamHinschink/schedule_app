import 'package:flutter/material.dart';
import 'package:scheduleapp/ui/contact_details/footer/activities/activities.dart';
import 'package:scheduleapp/ui/contacts/contact.dart';

class ContactActivities extends StatefulWidget {
  final Contact contact;

  const ContactActivities({Key key, this.contact}) : super(key: key);

  @override
  _ContactActivitiesState createState() => _ContactActivitiesState();
}

class _ContactActivitiesState extends State<ContactActivities>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabs = [
      Tab(text: 'Activities')
    ];

    _pages = [
      Activities()
    ];

    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TabBar(
            tabs: _tabs,
            controller: _tabController,
            indicatorColor: Colors.white,
          ),
          SizedBox.fromSize(
            size: Size.fromHeight(300.0),
            child: TabBarView(
              controller: _tabController,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}

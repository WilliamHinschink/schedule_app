import 'package:flutter/material.dart';
import 'package:scheduleapp/ui/contacts/contacts_list_page.dart';
import 'package:scheduleapp/ui/home/home_page.dart';

class BudgetScheduleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Color(0xFFF850DD)
      ),
      title: 'BudgetDash',
      home: HomePage(),
    );
  }
}

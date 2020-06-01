import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:http/http.dart' as http;
import 'package:scheduleapp/ui/contact_details/footer/activities/contact_activity.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  ScrollController _scrollController = ScrollController();
  List<ContactActivity> _contactActivities = [];
  int pageServer = 1;
  int pageIndex = 1;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _loadContactActivities();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadContactActivities();
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
    List<Widget> timelinePages = [
      _timelineModel(TimelinePosition.Left),
      _timelineModel(TimelinePosition.Center),
      _timelineModel(TimelinePosition.Right)
    ];

    return PageView(
      onPageChanged: (i) => setState(() => pageIndex = i),
      children: timelinePages,
    );
  }

  _timelineModel(TimelinePosition position) => Timeline.builder(
      controller: _scrollController,
      itemBuilder: _centerTimelineBuilder,
      lineColor: Colors.white,
      itemCount: _contactActivities.length,
      physics: position == TimelinePosition.Left
          ? ClampingScrollPhysics()
          : BouncingScrollPhysics(),
      position: position);

  TimelineModel _centerTimelineBuilder(BuildContext context, int index) {
    final activitieContact = _contactActivities[index];
    final textTheme = Theme.of(context).textTheme;
    return TimelineModel(
        Card(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  activitieContact.name,
                  style: textTheme.title,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  activitieContact.description,
                  style: textTheme.caption,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  activitieContact.created_at
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
        position: index % 2 == 0
            ? TimelineItemPosition.right
            : TimelineItemPosition.left,
        isFirst: index == 0,
        isLast: index == _contactActivities.length,
        icon: Icon(
          Icons.star,
          color: Colors.white,
        ),
        iconBackground: Colors.cyan);
  }

  Future<void> _loadContactActivities() async {
    http.Response response = await http.get(
        'https://api.github.com/orgs/octokit/repos?page=$pageServer&per_page=5',
        headers: {'Accept': 'application/vnd.github.v3+json'});
    setState(() {
      _contactActivities.addAll(ContactActivity.allFromResponse(response.body));
    });
    pageServer++;
  }
}

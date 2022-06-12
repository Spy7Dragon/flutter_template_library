import 'package:flutter_template_library/data/activity.dart';

class MainDataModel {
  final List<Activity> _selections = [
    Activity(identification: "Unknown"),
    Activity(identification: "Break")
  ];

  List<Activity> get selections => _selections;
}

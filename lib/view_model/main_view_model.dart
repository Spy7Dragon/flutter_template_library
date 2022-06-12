import 'package:flutter/cupertino.dart';
import 'package:flutter_template_library/data/activity.dart';
import 'package:flutter_template_library/data/main_data_model.dart';

class MainViewModel extends ChangeNotifier{
  List<Activity> get selections => data.selections;

  MainDataModel data = MainDataModel();

  MainViewModel();
}
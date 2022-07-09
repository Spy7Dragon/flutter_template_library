import 'package:flutter/material.dart';
import 'package:flutter_template_library/data/activity.dart';
import 'package:flutter_template_library/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeView> {
  final String title = 'Flutter Template Library';
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Column(children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: model.selections.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(model.selections[index].identification),
                      tileColor: selectedIndex == index ? Colors.blue : null,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  displayDescriptionInput(context, model);
                },
                child: Text('+'),
              ),
              ElevatedButton(
                onPressed: () {
                  model.selections.removeAt(selectedIndex);
                  model.notifyListeners();
                },
                child: Text('-'),
              ),
            ]));
      },
    );
  }

  String activityDescription = "";
  TextEditingController activityDescriptionController = TextEditingController();

  Future<void> displayDescriptionInput(
      BuildContext context, MainViewModel model) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Activity Description'),
          content: TextField(
            onChanged: (value) {
              activityDescription = value;
            },
            controller: activityDescriptionController,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('ADD'),
              onPressed: () {
                // Add item here
                model.selections
                    .add(Activity(identification: activityDescription));
                model.notifyListeners();
                activityDescription = "";
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}

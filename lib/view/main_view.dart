import 'package:flutter/material.dart';
import 'package:flutter_template_library/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(builder: (context, model, child) {
      return ListView.builder(
        itemCount: model.selections.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(model.selections[index].identification),
          );
        },
      );
    });
  }
}

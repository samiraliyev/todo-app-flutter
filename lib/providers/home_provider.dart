import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/task_model.dart';

class HomeProvider extends ChangeNotifier {
  final _getStorage = GetStorage();
  List<TaskModel> items = [];
  final TextEditingController controller = TextEditingController();
  bool isRedTheme = false;

  Future<void> addTask() async {
    items.add(TaskModel(controller.text, false));

    _getStorage.write("item", items);
    controller.text = '';

    notifyListeners();
  }

  Future<void> readTask() async {
    items = await _getStorage.read('item');

    notifyListeners();
  }

  void removeTask(index) {
    items.removeAt(index);
    notifyListeners();
  }

  void changeCheck(bool value, int index) {
    items[index].isSelected = value;
    notifyListeners();
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            ElevatedButton(
              onPressed: () {
                addTask();
                Navigator.pop(context);
              },
              child: const Text('SAVE'),
            ),
          ],
          title: TextField(
            autofocus: true,
            controller: controller,
            decoration: const InputDecoration(
              hintText: "add new task",
            ),
          ),
        );
      },
    );
  }

  Future<void> changeTheme(bool value) async {
    isRedTheme = value;
    SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    sharedprefs.setBool("theme", isRedTheme);
    notifyListeners();
  }

  Future<void> readTheme() async {
    SharedPreferences sharedprefs = await SharedPreferences.getInstance();

    isRedTheme = sharedprefs.getBool('theme') ?? false;
    notifyListeners();
  }
}

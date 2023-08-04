import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../model/task_model.dart';

class HomeProvider extends ChangeNotifier {
  String currentLang = 'en';

  List<TaskModel> items = [];
  final TextEditingController controller = TextEditingController();
  bool isRedTheme = false;
  SharedPreferences? sharedPref;

  HomeProvider() {
    init();
  }

  Future<void> init() async {
    sharedPref = await SharedPreferences.getInstance();
    final itemList = sharedPref!.getStringList('task');
    items =
        itemList!.map((e) => TaskModel(title: e, isSelected: false)).toList();

    isRedTheme = sharedPref?.getBool('theme') ?? false;
    readLanguage();
    notifyListeners();
  }

  void addTask() {
    items.add(TaskModel(title: controller.text, isSelected: false));

    controller.text = '';
    saveData();
    notifyListeners();
  }

  Future<void> saveData() async {
    final itemList = items.map((e) => e.title).toList();
    await sharedPref!.setStringList('task', itemList);
  }

  Future<void> readTask() async {
    notifyListeners();
  }

  void removeTask(index) {
    items.removeAt(index);
    saveData();
    notifyListeners();
  }

  void changeCheck(bool value, int index) {
    items[index].isSelected = value;
    saveData();
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
                if (controller.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      AppLocalizations.of(context)!.errorBar,
                      style: const TextStyle(color: Colors.white),
                    ),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }

                addTask();

                Navigator.pop(context);
              },
              child: Text(AppLocalizations.of(context)!.saveButton),
            ),
          ],
          title: TextField(
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.hintText,
            ),
          ),
        );
      },
    );
  }

  Future<void> changeTheme(bool value) async {
    isRedTheme = value;
    await sharedPref?.setBool("theme", isRedTheme);
    notifyListeners();
  }

  Future<void> changeLang(String name) async {
    currentLang = name;
    await sharedPref?.setString("lang", currentLang);
    notifyListeners();
  }

  void readLanguage() {
    currentLang = sharedPref?.getString("lang") ?? '';

    notifyListeners();
  }
}

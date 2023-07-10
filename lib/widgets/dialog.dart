import 'package:flutter/material.dart';

Future taskDialog(BuildContext context, TextEditingController controller,
    List<String> items) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "add new task",
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                items.add(controller.text);
                print(items);
                Navigator.pop(context);
              },
              child: const Text("SAVE"))
        ],
      );
    },
  );
}

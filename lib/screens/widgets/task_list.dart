import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Expanded(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20),
                right: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Checkbox(
                            value: provider.items[index].isSelected,
                            onChanged: (value) {
                              provider.changeCheck(value ?? false, index);
                            }),
                        title: Text(
                          provider.items[index].title,
                          style: TextStyle(
                              color: Colors.black,
                              decoration: provider.items[index].isSelected
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            provider.removeTask(index);
                          },
                          child: Icon(
                            Icons.delete,
                            color: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

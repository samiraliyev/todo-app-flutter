import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().readTask();
  }

  @override
  Widget build(BuildContext context) {
    final homeLogicWatch = context.watch<HomeProvider>();
    final homeLogicRead = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("To do list"),
        actions: [
          Switch(
              value: homeLogicWatch.isRedTheme,
              onChanged: (value) {
                homeLogicRead.changeTheme(value);
              })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.transparent,
              child: Center(
                  child: Text(
                "${homeLogicWatch.items.length} task",
                style: Theme.of(context).textTheme.headlineMedium,
              )),
            ),
          ),
          Expanded(
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
                child: ListView.builder(
                  itemCount: homeLogicWatch.items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Checkbox(
                              value: homeLogicWatch.items[index].isSelected,
                              onChanged: (value) {
                                homeLogicRead.changeCheck(value!, index);
                              }),
                          title: Text(
                            homeLogicWatch.items[index].title,
                            style: const TextStyle(color: Colors.black),
                          ),
                          trailing: InkWell(
                            onTap: () {
                              homeLogicRead.removeTask(index);
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
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeLogicRead.openDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

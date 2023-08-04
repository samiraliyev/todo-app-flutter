import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/home_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/task_header.dart';
import 'widgets/task_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!;

    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: _appBar(provider, language),
          body: _body(provider, language, context),
          floatingActionButton: _floatButton(provider, context),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }

  FloatingActionButton _floatButton(
      HomeProvider provider, BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        provider.openDialog(context);
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _body(
      HomeProvider provider, AppLocalizations language, BuildContext context) {
    return const Column(
      children: [ShowTaskHeader(), TaskList()],
    );
  }

  AppBar _appBar(HomeProvider provider, AppLocalizations language) {
    return AppBar(
      leading: Switch(
          value: provider.isRedTheme,
          onChanged: (value) {
            provider.changeTheme(value);
          }),
      title: Text(language.appName),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: DropdownButton(
            value: provider.currentLang,
            items: <String>['en', 'az', 'tr']
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e,
                        style: const TextStyle(
                          color: Colors.white,
                        )),
                    onTap: () {
                      provider.changeLang(e);
                    },
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                provider.currentLang = value ?? '';
              });
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/home_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/tutorial/tutorial_coach_mark.dart';

import '../providers/tutorial_provider.dart';
import 'widgets/task_header.dart';
import 'widgets/task_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TutorialCoachMarkManager tutorialCoachMarkManager =
      TutorialCoachMarkManager();
  TutorialProvider tutorialProvider = TutorialProvider();

  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(
          seconds: 1,
        ), () async {
      await tutorialProvider.readSignIn();
      if (tutorialProvider.isFirstSignIn) {
        return;
      }
      tutorialCoachMarkManager.initialTarget(context);
    });
  }

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
      key: tutorialCoachMarkManager.fabKey,
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
          key: tutorialCoachMarkManager.themeKey,
          value: provider.isRedTheme,
          onChanged: (value) {
            provider.changeTheme(value);
          }),
      title: Text(key: tutorialCoachMarkManager.nameKey, language.appName),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: DropdownButton(
            key: tutorialCoachMarkManager.langKey,
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

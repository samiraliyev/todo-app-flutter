import 'package:flutter/material.dart';
import 'package:todo_app/providers/home_provider.dart';
import 'package:todo_app/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'constants/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
    )
  ], child: const MyWidget()));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, HomeProvider provider, child) {
        return MaterialApp(
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: Locale(provider.currentLang),
          theme: provider.isRedTheme
              ? AppThemeData().redTheme
              : AppThemeData().greenTheme,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}

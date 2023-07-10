import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/providers/home_provider.dart';
import 'package:todo_app/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'constants/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) {
        return HomeProvider();
      },
    )
  ], child: const MyWidget()));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().readTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<HomeProvider>().isRedTheme
          ? AppThemeData().redTheme
          : AppThemeData().greenTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

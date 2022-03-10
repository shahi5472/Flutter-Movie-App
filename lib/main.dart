import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_app/router_name.dart';
import 'package:flutter_movie_app/utils/k_strings.dart';
import 'package:flutter_movie_app/utils/my_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: KString.appName,
      theme: MyTheme.theme,
      initialRoute: Routes.home,
      routes: Routes.routes,
    );
  }
}

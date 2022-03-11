import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_app/controllers/bottom_nav_controller.dart';
import 'package:flutter_movie_app/controllers/dashboard_controller.dart';
import 'package:flutter_movie_app/controllers/watch_controller.dart';
import 'package:flutter_movie_app/router_name.dart';
import 'package:flutter_movie_app/utils/k_strings.dart';
import 'package:flutter_movie_app/utils/my_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BottomNavController()),
      ChangeNotifierProvider(create: (_) => DashboardController()),
      ChangeNotifierProvider(create: (_) => WatchController()),
    ],
    child: const MyApp(),
  ));
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

import 'package:flutter/material.dart';
import 'package:ft_test_app/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

Future main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeatSync',
      theme: FlexThemeData.light(scheme: FlexScheme.flutterDash),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.flutterDash),
      themeMode: ThemeMode.light,
      home: const MyHomePage(title: 'HeatSync'),
    );
  }
}

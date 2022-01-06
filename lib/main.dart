import 'package:flutter/material.dart';
import 'package:tictoa/ui/Game_home_page.dart';
import 'package:tictoa/ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,

        // theme: ThemeD ata(
        //   colorScheme: const ColorScheme.light(primary: Colors.red),

        home: const GameHomePage());
  }
}

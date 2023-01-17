import 'package:flutter/material.dart';
import 'package:pokemon/theme.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyTheme.myTheme(context),
        initialRoute: "/home",
        debugShowCheckedModeBanner: false,
        routes: {
          "/home": (context) => HomePage(),
        });
  }
}

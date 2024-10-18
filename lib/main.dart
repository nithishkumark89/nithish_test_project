import 'package:flutter/material.dart';
import 'package:nithishkumar_test_project/Presentation/login/screen_login.dart';

import 'Presentation/Home/screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const ScreenNavigation(),
      initialRoute: '/',
      theme: ThemeData(
        brightness: Brightness.dark,
        // Define your light theme
      ),
      // darkTheme: ThemeData.dark(),
      //     .copyWith(
      //   appBarTheme: const AppBarTheme(color: Color(0xFF253341)),
      //   scaffoldBackgroundColor: const Color(0xFF15202B),
      // ),
        themeMode: ThemeMode.light,
      routes: {
        '/': (context) => ScreenLogin(),
        '/home':(context) => const ScreenHome(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
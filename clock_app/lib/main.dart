import 'package:clock_app/views/screens/clock_page.dart';
import 'package:clock_app/views/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      routes: {
        '/': (context) => const HomePage(),
        'clock_page': (context) => const ClockPage(),
      },
    );
  }
}

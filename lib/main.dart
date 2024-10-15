import 'package:flutter/material.dart';
import 'package:pr6_corpsis/pages/home_page.dart'; // Проверьте, что путь правильный
import 'package:pr6_corpsis/pages/favorite_page.dart';
import 'package:pr6_corpsis/pages/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Убираем метку debug
      title: 'My App',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system, // Настройка темы
      home: HomePage(), // Здесь используется HomePage
    );
  }
}

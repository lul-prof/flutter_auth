import 'package:flutter/material.dart';
import 'package:flutter_auth_system/views/widget_tree.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
          ),
      ),
      debugShowCheckedModeBanner: false,
      home:WidgetTree(),
    );
  }
}

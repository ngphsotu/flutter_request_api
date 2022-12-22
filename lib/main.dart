import 'package:flutter/material.dart';
import 'screens/list_view_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Request API',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const ListViewScreen(),
    );
  }
}

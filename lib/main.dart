import 'package:flutter/material.dart';
import 'package:homework5/show_api.dart';
import 'package:homework5/home_page.dart';
import 'package:homework5/widgets/movies.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework5',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 222, 52, 88)),
        useMaterial3: true,
      ),
  
      home: const HomePage(),
      // home:  ShowAPI(), 
      // home: Movies(),
    );
  }
}


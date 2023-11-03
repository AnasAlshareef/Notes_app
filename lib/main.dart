import 'package:flutter/material.dart';
import 'package:todol/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme:  ThemeData(
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
  ),

      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,

    );
  }
}
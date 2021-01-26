import 'package:flutter/material.dart';
import 'package:pexels/core/styles/styles.dart';
import 'package:pexels/presenter/pages/main_page.dart';
import 'package:pexels/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Styles.themeData(context),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterGenerator.generatedRoute,
    );
  }
}
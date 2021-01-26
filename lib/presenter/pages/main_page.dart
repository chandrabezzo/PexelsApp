import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static const String routeName = "/main";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Text("Body"),
    );
  }
}
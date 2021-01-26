import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = "/detail";

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
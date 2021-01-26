import 'package:flutter/material.dart';
import 'package:pexels/presenter/widgets/photos_grid.dart';
import 'package:pexels/presenter/widgets/photos_list.dart';

class MainPage extends StatefulWidget {
  static const String routeName = "/main";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool _isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.grid_view,
              color: (_isGrid) ? Colors.white : Color(0xffbfbfbf),
            ),
            onPressed: () {
              setState(() {
                _isGrid = true;
              });
            }
          ),
          IconButton(
            icon: Icon(
              Icons.list,
              color: (!_isGrid) ? Colors.white : Color(0xffbfbfbf),
            ),
            onPressed: () {
              setState(() {
                _isGrid = false;
              });
            }
          ),
        ],
      ),
      body: (_isGrid) ? PhotosGrid() : PhotosList(),
    );
  }
}
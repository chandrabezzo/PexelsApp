import 'package:flutter/material.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:pexels/presenter/pages/detail_page.dart';
import 'package:pexels/presenter/pages/main_page.dart';

class RouterGenerator {
  static MaterialPageRoute<dynamic> _moveTo(Widget view){
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> generatedRoute(RouteSettings settings){
    switch(settings.name){
      case MainPage.routeName:
        return _moveTo(MainPage());
      case DetailPage.routeName:
        final args = settings.arguments as Photo;
        return _moveTo(DetailPage(args));
      default:
        return _moveTo(MainPage());
    }
  }
}
import 'package:flutter/material.dart';
import 'package:pexels/domain/entities/photo.dart';

class PhotosList extends StatelessWidget {
  
  final List<Photo> _photos;
  
  PhotosList({
    @required List<Photo> photos
  }): _photos = photos;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        return Row(children: [
          Text("tes"),
          Text("tes")
        ]);
      },
      itemCount: 20,
    );
  }
}
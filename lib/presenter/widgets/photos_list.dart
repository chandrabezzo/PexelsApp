import 'package:flutter/material.dart';
import 'package:pexels/core/rectangle_image.dart';
import 'package:pexels/core/styles/text_styles.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:pexels/presenter/pages/detail_page.dart';

class PhotosList extends StatelessWidget {
  
  final List<Photo> photos;
  
  PhotosList(this.photos);
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        final photo = photos[index];
        return ListTile(
          leading: RectangleImage(
            width: 70,
            height: 100,
            path: photo.src.medium,
            type: RectangleImageType.Network,
          ),
          title: Text("Photographer: ", style: black12400),
          subtitle: Text(photo.photographer, style: primary15600),
          trailing: Icon(
            Icons.favorite,
            color: photo.liked
                ? Colors.red
                : Colors.grey
          ),
          onTap: () => Navigator.pushNamed(context, DetailPage.routeName, arguments: photo),
        );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: photos.length,
    );
  }
}
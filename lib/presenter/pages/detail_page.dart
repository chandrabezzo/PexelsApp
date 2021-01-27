import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pexels/core/styles/colors.dart';
import 'package:pexels/core/styles/text_styles.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = "/detail";

  final Photo photo;

  DetailPage(this.photo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              title: Text(photo.photographer),
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: photo.src.original,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: Card(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              ),
            ),
          ];
        },
        body: ListTile(
          title: Text("Photographer: ", style: black12400),
          subtitle: Text(photo.photographer, style: primary15600),
          trailing: IconButton(
            icon: Icon(Icons.explore_rounded, color: colorPrimary),
            onPressed: () => launch(photo.photographerUrl),
          ),
        ),
      ),
    );
  }
}
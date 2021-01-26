import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pexels/core/styles/text_styles.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:shimmer/shimmer.dart';

class TileGrid extends StatelessWidget {

  const TileGrid(this.photo);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      child: Column(children: [
        CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: photo.src.medium,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Card(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 8, top: 12, bottom: 12),
          child: Row(children: [
            Expanded(
              child: Column(children: [
                Text("Photographer: ", style: black12400),
                Text(photo.photographer, style: primary15600)
              ], crossAxisAlignment: CrossAxisAlignment.start),
            ),
            Icon(
              Icons.favorite,
              color: photo.liked
                  ? Colors.red
                  : Colors.grey
            )
          ]),
        )
      ]),
    );
  }
}
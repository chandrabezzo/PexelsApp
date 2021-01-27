import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RectangleImage extends StatelessWidget {

  final String path;
  final RectangleImageType type;
  final double width;
  final double height;
  final BoxFit fit;
  final Map<String, String> headers;

  RectangleImage({@required this.path, @required this.type,
    this.width:25, this.height:25, this.fit:BoxFit.fill, this.headers});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
              fit: fit,
              image: (type == RectangleImageType.Network)
                  ? networkImage(path)
                  : assetImage(path)
          )
      ),
    );
  }

  ImageProvider networkImage(String url){
    return CachedNetworkImageProvider(
      url
    );
  }

  ImageProvider assetImage(String url){
    return AssetImage(url);
  }
}

enum RectangleImageType {
  Network,
  Asset
}
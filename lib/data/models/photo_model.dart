import 'package:flutter/cupertino.dart';
import 'package:pexels/data/converter/src_converter.dart';
import 'package:pexels/data/converter/src_model_converter.dart';
import 'package:pexels/data/models/src_model.dart';
import 'package:pexels/domain/entities/photo.dart';

class PhotoModel extends Photo {
  PhotoModel({
    @required int id,
    @required int width,
    @required int height,
    @required String url,
    @required String photographer,
    @required String photographerUrl,
    @required int photographerId,
    @required String avgColor,
    @required SrcModel src,
    @required bool liked,
  }): super(
    width: width,
    url: url,
    src: (src != null) ? SrcConverter.convert(src) : null,
    photographerUrl: photographerUrl,
    photographerId: photographerId,
    photographer: photographer,
    liked: liked,
    avgColor: avgColor,
    height: height,
    id: id
  );

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    id: json["id"],
    width: json["width"],
    height: json["height"],
    url: json["url"],
    photographer: json["photographer"],
    photographerUrl: json["photographer_url"],
    photographerId: json["photographer_id"],
    avgColor: json["avg_color"],
    src: (json["src"] != null) ? SrcModel.fromJson(json["src"]) : null,
    liked: json["liked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "width": width,
    "height": height,
    "url": url,
    "photographer": photographer,
    "photographer_url": photographerUrl,
    "photographer_id": photographerId,
    "avg_color": avgColor,
    "src": (src != null) ? SrcModelConverter.convert(src).toJson() : null,
    "liked": liked,
  };
}
import 'package:pexels/data/models/src_model.dart';

class PhotoModel {
  PhotoModel({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.liked,
  });

  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  String avgColor;
  SrcModel src;
  bool liked;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    id: json["id"],
    width: json["width"],
    height: json["height"],
    url: json["url"],
    photographer: json["photographer"],
    photographerUrl: json["photographer_url"],
    photographerId: json["photographer_id"],
    avgColor: json["avg_color"],
    src: SrcModel.fromJson(json["src"]),
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
    "src": src.toJson(),
    "liked": liked,
  };
}
import 'package:pexels/data/models/photo_model.dart';

class PhotosResponseModel {
  PhotosResponseModel({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
  });

  int page;
  int perPage;
  List<PhotoModel> photos;
  int totalResults;
  String nextPage;

  factory PhotosResponseModel.fromJson(Map<String, dynamic> json) => PhotosResponseModel(
    page: json["page"],
    perPage: json["per_page"],
    photos: (json["photos"] != null) ? List<PhotoModel>.from(json["photos"].map((x) => PhotoModel.fromJson(x))) : null,
    totalResults: json["total_results"],
    nextPage: json["next_page"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "photos": (photos != null) ? List<dynamic>.from(photos.map((x) => x.toJson())) : null,
    "total_results": totalResults,
    "next_page": nextPage,
  };
}

import 'package:flutter/material.dart';
import 'package:pexels/data/converter/photo_model_converter.dart';
import 'package:pexels/data/models/photo_model.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:pexels/domain/entities/photos_response.dart';

class PhotosResponseModel extends PhotosResponse {
  PhotosResponseModel({
    @required int page,
    @required int perPage,
    @required List<PhotoModel> photos,
    @required int totalResults,
    @required String nextPage,
  }): super(
    page: page,
    nextPage: nextPage,
    perPage: perPage,
    photos: photos,
    totalResults: totalResults
  );

  factory PhotosResponseModel.fromJson(Map<String, dynamic> json) => PhotosResponseModel(
    page: json["page"],
    perPage: json["per_page"],
    photos: (json["photos"] != null)
      ? List<PhotoModel>.from(json["photos"].map((x) => PhotoModel.fromJson(x)))
      : null,
    totalResults: json["total_results"],
    nextPage: json["next_page"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "photos": (photos != null)
      ? List<dynamic>.from(photos.map((Photo x) => PhotoModelConverter.convert(x)?.toJson()))
      : null,
    "total_results": totalResults,
    "next_page": nextPage,
  };
}

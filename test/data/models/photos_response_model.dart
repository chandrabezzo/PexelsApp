import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pexels/data/models/photo_model.dart';
import 'package:pexels/data/models/photos_response_model.dart';
import 'package:pexels/data/models/src_model.dart';
import 'package:pexels/domain/entities/photos_response.dart';

import '../../util/json_reader.dart';

void main(){
  final model = PhotosResponseModel(
    page: 1,
    perPage: 1,
    photos: [
      PhotoModel(
        id: 1,
        height: 1,
        avgColor: "test",
        liked: false,
        photographer: "test",
        photographerId: 1,
        photographerUrl: "test",
        src: SrcModel(
          tiny: "test",
          small: "test",
          portrait: "test",
          original: "test",
          medium: "test",
          large: "test",
          large2X: "test",
          landscape: "test",
        ),
        url: "test",
        width: 1
      ),
      PhotoModel(
        id: 2,
        height: 1,
        avgColor: "test",
        liked: false,
        photographer: "test",
        photographerId: 1,
        photographerUrl: "test",
        src: SrcModel(
          tiny: "test",
          small: "test",
          portrait: "test",
          original: "test",
          medium: "test",
          large: "test",
          large2X: "test",
          landscape: "test",
        ),
        url: "test",
        width: 1
      )
    ],
    totalResults: 1,
    nextPage: "test"
  );

  group("Photos Response Model", (){
    test("Subclass", (){
      expect(model, isA<PhotosResponse>());
    });

    test("From Json", (){
      final jsonMap = json.decode(jsonReader("photos.json"));
      final result = PhotosResponseModel.fromJson(jsonMap);
      expect(result, isA<PhotosResponseModel>());
      identical(result, model);
    });

    test("To Json", (){
      final result = model.toJson();
      final expected = {
        "page": 1,
        "per_page": 1,
        "photos": [
          {
            "id": 1,
            "height": 1,
            "avg_color": "test",
            "liked": false,
            "photographer": "test",
            "photographer_id": 1,
            "photographer_url": "test",
            "src": {
              "tiny": "test",
              "small": "test",
              "portrait": "test",
              "original": "test",
              "medium": "test",
              "large": "test",
              "large2x": "test",
              "landscape": "test"
            },
            "url": "test",
            "width": 1
          },
          {
            "id": 2,
            "height": 1,
            "avg_color": "test",
            "liked": false,
            "photographer": "test",
            "photographer_id": 1,
            "photographer_url": "test",
            "src": {
              "tiny": "test",
              "small": "test",
              "portrait": "test",
              "original": "test",
              "medium": "test",
              "large": "test",
              "large2x": "test",
              "landscape": "test"
            },
            "url": "test",
            "width": 1
          }
        ],
        "total_results": 1,
        "next_page": "test"
      };

      expect(result, expected);
    });
  });
}
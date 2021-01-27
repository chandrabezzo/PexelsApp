import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pexels/data/models/photo_model.dart';
import 'package:pexels/data/models/src_model.dart';
import 'package:pexels/domain/entities/photo.dart';

import '../../util/json_reader.dart';

void main(){
  final model = PhotoModel(
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
  );

  group("Photo Model", (){
    test("Subclass", (){
      expect(model, isA<Photo>());
    });

    test("From Json", (){
      final jsonMap = json.decode(jsonReader("photo.json"));
      final result = PhotoModel.fromJson(jsonMap);
      expect(result, isA<PhotoModel>());
      identical(result, model);
    });

    test("To Json", (){
      final result = model.toJson();
      final expected = {
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
      };
      expect(result, expected);
    });
  });
}
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pexels/data/models/src_model.dart';
import 'package:pexels/domain/entities/src.dart';

import '../../util/json_reader.dart';

void main(){
  final model = SrcModel(
    original: "test",
    large2X: "test",
    large: "test",
    medium: "test",
    small: "test",
    portrait: "test",
    landscape: "test",
    tiny: "test"
  );

  group("Src Model", (){
    test("Subclass", (){
      expect(model, isA<Src>());
    });

    test("From Json", (){
      final jsonMap = json.decode(jsonReader("src.json"));
      final result = SrcModel.fromJson(jsonMap);
      expect(result, isA<SrcModel>());
      identical(result, model);
    });

    test("To Json", (){
      final result = model.toJson();
      final expected = {
        "original": "test",
        "large2x": "test",
        "large": "test",
        "medium": "test",
        "small": "test",
        "portrait": "test",
        "landscape": "test",
        "tiny": "test"
      };
      expect(result, expected);
    });
  });
}
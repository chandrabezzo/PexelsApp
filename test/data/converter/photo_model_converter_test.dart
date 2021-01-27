import 'package:flutter_test/flutter_test.dart';
import 'package:pexels/data/converter/photo_model_converter.dart';
import 'package:pexels/data/models/photo_model.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:pexels/domain/entities/src.dart';

void main(){
  group("Photo Model Converter", (){
    test("Photo Model Convert", (){
      final model = Photo(
          id: 1,
          height: 1,
          avgColor: "test",
          liked: false,
          photographer: "test",
          photographerId: 1,
          photographerUrl: "test",
          src: Src(
              tiny: "test",
              small: "test",
              portrait: "test",
              original: "test",
              medium: "test",
              large: "test",
              large2X: "test",
              landscape: "test"
          ),
          url: "test",
          width: 1
      );

      final photo = PhotoModelConverter.convert(model);
      expect(photo, isA<PhotoModel>());
    });

    test("Photo Model Converts", (){
      final models = List<Photo>();

      for(int counter = 0; counter < 5; counter++){
        models.add(Photo(
            id: 1,
            height: 1,
            avgColor: "test",
            liked: false,
            photographer: "test",
            photographerId: 1,
            photographerUrl: "test",
            src: Src(
                tiny: "test",
                small: "test",
                portrait: "test",
                original: "test",
                medium: "test",
                large: "test",
                large2X: "test",
                landscape: "test"
            ),
            url: "test",
            width: 1
        ));
      }

      final photos = PhotoModelConverter.converts(models);
      expect(photos, isA<List<PhotoModel>>());
    });
  });
}
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pexels/data/models/photos_response_model.dart';
import 'package:pexels/domain/repositories/photo_repository.dart';
import 'package:pexels/domain/usecases/get_photo.dart';
import 'package:pexels/domain/usecases/get_photos.dart';

import '../util/json_reader.dart';

class MockPhotoRepository extends Mock implements PhotoRepository {}

void main(){
  GetPhotos _usecase;
  MockPhotoRepository _repository;

  setUp((){
    _repository = MockPhotoRepository();
    _usecase = GetPhotos(repository: _repository);
  });

  test("Get Photos", () async {
    final map = json.decode(jsonReader("photos.json"));
    final photosResponse = PhotosResponseModel.fromJson(map);

    when(_repository.photos(any)).thenAnswer((_) async => Right(photosResponse.photos));
    final result = await _usecase(ParamsGetPhotos(1));

    expect(result, Right(photosResponse.photos));
    verify(_repository.photos(1));
    verifyNoMoreInteractions(_repository);
  });
}
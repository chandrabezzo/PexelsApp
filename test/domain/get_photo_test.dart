import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pexels/data/models/photo_model.dart';
import 'package:pexels/domain/repositories/photo_repository.dart';
import 'package:pexels/domain/usecases/get_photo.dart';

import '../util/json_reader.dart';

class MockPhotoRepository extends Mock implements PhotoRepository {}

void main(){
  GetPhoto _usecase;
  MockPhotoRepository _repository;

  setUp((){
    _repository = MockPhotoRepository();
    _usecase = GetPhoto(repository: _repository);
  });
  
  test("Get Photo", () async {
    final map = json.decode(jsonReader("photo.json"));
    final photoResponse = PhotoModel.fromJson(map);

    when(_repository.photo(any)).thenAnswer((_) async => Right(photoResponse));
    final result = await _usecase(ParamsGetPhoto(6399697));

    expect(result, Right(photoResponse));
    verify(_repository.photo(6399697));
    verifyNoMoreInteractions(_repository);
  });
}
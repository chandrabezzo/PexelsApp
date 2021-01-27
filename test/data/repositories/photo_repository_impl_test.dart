import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pexels/core/network/network_info.dart';
import 'package:pexels/data/converter/photo_converter.dart';
import 'package:pexels/data/converter/photo_response_converter.dart';
import 'package:pexels/data/datasources/photo_local_datasource.dart';
import 'package:pexels/data/datasources/photo_remote_datasource.dart';
import 'package:pexels/data/models/photo_model.dart';
import 'package:pexels/data/models/photos_response_model.dart';
import 'package:pexels/domain/entities/photos_response.dart';

import '../../util/json_reader.dart';

class MockRemoteDataSource extends Mock implements PhotoRemoteDatasource {}

class MockLocalDataSource extends Mock implements PhotoLocalDatasource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main(){
  PhotoRemoteDatasourceImpl _repository;
  MockRemoteDataSource _remoteDatasource;
  MockLocalDataSource _localDatasource;
  MockNetworkInfo _networkInfo;

  setUp((){
    _repository = PhotoRemoteDatasourceImpl();
    _remoteDatasource = MockRemoteDataSource();
    _localDatasource = MockLocalDataSource();
    _networkInfo = MockNetworkInfo();
  });

  group("Photo Repository", (){
    test("Should return remote data photos", () async {
      final map = json.decode(jsonReader("photos.json"));
      final photosResponse = PhotosResponseModel.fromJson(map);
      
      when(_remoteDatasource.getPhotos(any))
        .thenAnswer((_) async => photosResponse);

      final result = await _repository.getPhotos(1);
      identical(result, PhotoResponseConverter.convert(photosResponse));
    });

    test("Should return remote data photo", () async {
      final map = json.decode(jsonReader("photo.json"));
      final photo = PhotoModel.fromJson(map);

      when(_remoteDatasource.getPhoto(any))
        .thenAnswer((_) async => photo);

      final result = await _repository.getPhoto(6399697);
      identical(result, PhotoConverter.convert(photo));
    });

    test("Should return local data photos", () async {
      final map = json.decode(jsonReader("photos.json"));
      final photosResponse = PhotosResponseModel.fromJson(map);

      when(_localDatasource.getPhotos())
          .thenAnswer((_) async => photosResponse.photos);
      final result = await _repository.getPhotos(1);

      expect(result, isA<PhotosResponse>());
      identical(result, PhotoResponseConverter.convert(photosResponse));
    });
  });
}

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pexels/core/cache_helper.dart';
import 'package:pexels/data/datasources/photo_local_datasource.dart';
import 'package:pexels/data/models/photo_model.dart';
import 'package:pexels/data/models/src_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/json_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

Map<String, dynamic> initialValue(){
  final test = Map<String, dynamic>();
  test["test"] = "test";

  return test;
}

void main(){
  TestWidgetsFlutterBinding.ensureInitialized();

  MockSharedPreferences _prefs;
  PhotoLocalDatasourceImpl _datasource;

  setUp((){
    _prefs = MockSharedPreferences();
    _datasource = PhotoLocalDatasourceImpl(CacheHelper(_prefs));
    SharedPreferences.setMockInitialValues(initialValue());
  });

  group("Photo Local Datasource", (){
    final photos = List<PhotoModel>();
    photos.add(PhotoModel(
      width: 1,
      url: "test",
      src: SrcModel(
        landscape: "test",
        large2X: "test",
        large: "test",
        medium: "test",
        original: "test",
        portrait: "test",
        small: "test",
        tiny: "test",
      ),
      photographerUrl: "test",
      photographerId: 1,
      photographer: "test",
      liked: false,
      avgColor: "test",
      height: 1,
      id: 1
    ));

    test("Save Photos to local", () async {
      when(_prefs.setString(any, any)).thenAnswer((_) async => true);

      await _datasource.savePhotos(photos);
      List<String> _dataList = photos?.map((value) {
        return jsonEncode(value.toJson());
      })?.toList();
      verify(_prefs.setStringList("photos", _dataList));
    });

    test("Get Photos from local", () async {
      final photoJson = jsonReader("photos.json");

      when(_prefs.getString(any))
        .thenReturn(photoJson);

      await _datasource.getPhotos();

      verify(_prefs.getStringList("photos"));
    });
  });
}
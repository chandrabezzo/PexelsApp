import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pexels/data/models/photos_response_model.dart';
import 'package:pexels/domain/usecases/get_photo.dart';
import 'package:pexels/domain/usecases/get_photos.dart';
import 'package:pexels/presenter/blocs/photos/photos_bloc.dart';
import 'package:pexels/presenter/blocs/photos/photos_event.dart';
import 'package:pexels/presenter/blocs/photos/photos_state.dart';

import '../../util/json_reader.dart';

class MockGetPhotos extends Mock implements GetPhotos {}

class MockGetPhoto extends Mock implements GetPhoto {}

void main(){
  PhotosBloc _bloc;
  MockGetPhotos _getPhotos;

  setUp((){
    _getPhotos = MockGetPhotos();

    _bloc = PhotosBloc(getPhotos: _getPhotos);
  });

  test("Initial state should be empty", (){
    expect(_bloc.state, equals(null));
  });

  group("Photos BLoC", (){
    final mapPhoto = json.decode(jsonReader("photos.json"));
    final photosResponse = PhotosResponseModel.fromJson(mapPhoto);

    blocTest("Should return data empty when call photos loaded",
      build: () => _bloc,
      act: (PhotosBloc bloc) => bloc.add(PhotosLoaded(1)),
      expect: [isA<PhotosLoadInProgress>(), isA<PhotosEmpty>()]
    );

    blocTest("Should return data when call photos loaded",
      build: () => _bloc,
      act: (PhotosBloc bloc){
        when(_getPhotos(any))
            .thenAnswer((_) async => Right(photosResponse.photos));

        bloc.add(PhotosLoaded(1));
      },
      expect: [isA<PhotosLoadInProgress>(), isA<PhotosLoadSuccess>()],
      verify: (_){
        verify(_getPhotos(ParamsGetPhotos(1)));
      },
    );

    blocTest("Should return data when call photos updated",
        build: () => _bloc,
        act: (PhotosBloc bloc){
          when(_getPhotos(any))
              .thenAnswer((_) async => Right(photosResponse.photos));

          bloc.add(PhotosUpdated(2));
        },
        expect: [isA<PhotosLoadSuccess>()],
        verify: (_){
          verify(_getPhotos(ParamsGetPhotos(2)));
        }
    );
  });
}
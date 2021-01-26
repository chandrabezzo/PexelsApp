import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:pexels/domain/usecases/get_photo.dart';
import 'package:pexels/presenter/blocs/photo/photo_event.dart';
import 'package:pexels/presenter/blocs/photo/photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final GetPhoto _getPhoto;

  PhotoBloc({
    @required GetPhoto getPhoto
  }): _getPhoto = getPhoto, super(null);

  @override
  Stream<PhotoState> mapEventToState(PhotoEvent event) async* {
    if(event is PhotoLoaded){
      yield* _mapPhotoLoadedToState(event);
    }
  }

  Stream<PhotoState> _mapPhotoLoadedToState(PhotoLoaded event) async* {
    yield PhotoLoadInProgress();

    final getPhoto = await _getPhoto(ParamsGetPhoto(event.idPhoto));

    yield getPhoto.fold(
      (failure) => PhotoLoadFailed(),
      (Photo photo) => PhotoLoadSuccess(photo)
    );
  }
}
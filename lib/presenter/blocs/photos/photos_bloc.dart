import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels/domain/entities/photos_response.dart';
import 'package:pexels/domain/usecases/get_photos.dart';
import 'package:pexels/presenter/blocs/photos/photos_event.dart';
import 'package:pexels/presenter/blocs/photos/photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final GetPhotos _getPhotos;

  PhotosBloc({
    @required GetPhotos getPhotos
  }): _getPhotos = getPhotos, super(null);

  @override
  Stream<PhotosState> mapEventToState(PhotosEvent event) async* {
    if(event is PhotosLoaded){
      yield* _mapPhotosLoadedToState(event);
    }
    else if(event is PhotosUpdated){
      yield* _mapPhotosUpdatedToState(event);
    }
  }

  Stream<PhotosState> _mapPhotosLoadedToState(PhotosLoaded event) async* {
    yield PhotosLoadInProgress();

    final getPhotos = await _getPhotos(ParamsGetPhotos(event.page));

    yield getPhotos.fold(
      (failure) => PhotosLoadFailed(),
      (PhotosResponse response) => PhotosLoadSuccess(response)
    );
  }

  Stream<PhotosState> _mapPhotosUpdatedToState(PhotosUpdated event) async* {
    final getPhotos = await _getPhotos(ParamsGetPhotos(event.page));

    yield getPhotos.fold(
      (failure) => PhotosUpdateFailed(),
      (PhotosResponse response) => PhotosLoadSuccess(response)
    );
  }
}
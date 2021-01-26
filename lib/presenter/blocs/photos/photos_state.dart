import 'package:equatable/equatable.dart';
import 'package:pexels/domain/entities/photo.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();

  @override
  List<Object> get props => [];
}

class PhotosLoadInProgress extends PhotosState {}

class PhotosLoadSuccess extends PhotosState {
  final List<Photo> photos;

  const PhotosLoadSuccess(this.photos);

  @override
  List<Object> get props => [photos];
}

class PhotosEmpty extends PhotosState {}

class PhotosLoadFailed extends PhotosState {}

class PhotosUpdateFailed extends PhotosState {}
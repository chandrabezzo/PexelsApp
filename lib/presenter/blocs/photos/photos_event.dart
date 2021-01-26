import 'package:equatable/equatable.dart';

abstract class PhotosEvent extends Equatable {
  const PhotosEvent();

  @override
  List<Object> get props => [];
}

class PhotosLoaded extends PhotosEvent {
  final int page;

  const PhotosLoaded(this.page);

  @override
  List<Object> get props => [page];
}

class PhotosUpdated extends PhotosEvent {
  final int page;

  const PhotosUpdated(this.page);

  @override
  List<Object> get props => [page];
}
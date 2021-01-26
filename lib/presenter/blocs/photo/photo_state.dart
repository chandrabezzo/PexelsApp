import 'package:equatable/equatable.dart';
import 'package:pexels/domain/entities/photo.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoLoadInProgress extends PhotoState {}

class PhotoLoadSuccess extends PhotoState {
  final Photo photo;

  const PhotoLoadSuccess(this.photo);

  @override
  List<Object> get props => [photo];
}

class PhotoLoadFailed extends PhotoState {}
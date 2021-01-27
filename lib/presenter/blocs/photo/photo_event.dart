import 'package:equatable/equatable.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class PhotoLoaded extends PhotoEvent {
  final int idPhoto;

  const PhotoLoaded(this.idPhoto);

  @override
  List<Object> get props => [idPhoto];
}
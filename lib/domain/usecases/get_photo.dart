import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pexels/core/error/failures.dart';
import 'package:pexels/core/usecase.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:pexels/domain/repositories/photo_repository.dart';

class ParamsGetPhoto extends Equatable {
  final int idPhoto;

  const ParamsGetPhoto(this.idPhoto);

  @override
  List<Object> get props => [idPhoto];
}

class GetPhoto extends UseCase<Photo, ParamsGetPhoto> {
  final PhotoRepository _repository;

  GetPhoto({
    @required PhotoRepository repository
  }): _repository = repository;

  @override
  Future<Either<Failure, Photo>> call(ParamsGetPhoto params) async {
    return await _repository.photo(params.idPhoto);
  }
}
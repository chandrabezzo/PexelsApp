import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pexels/core/error/failures.dart';
import 'package:pexels/core/usecase.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:pexels/domain/repositories/photo_repository.dart';

class ParamsGetPhotos extends Equatable {
  final int page;

  const ParamsGetPhotos(this.page);

  @override
  List<Object> get props => [page];
}

class GetPhotos extends UseCase<List<Photo>, ParamsGetPhotos> {
  final PhotoRepository _repository;

  GetPhotos({
    @required PhotoRepository repository
  }): _repository = repository;
  
  @override
  Future<Either<Failure, List<Photo>>> call(ParamsGetPhotos params) async {
    return await _repository.photos(params.page);
  }
}
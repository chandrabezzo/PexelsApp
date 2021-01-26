import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pexels/core/error/exceptions.dart';
import 'package:pexels/core/error/failures.dart';
import 'package:pexels/data/datasources/photo_remote_datasource.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:pexels/domain/entities/photos_response.dart';
import 'package:pexels/domain/repositories/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDatasource _remoteDatasource;

  PhotoRepositoryImpl({
    @required PhotoRemoteDatasource remoteDatasource
  }): _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, Photo>> photo(int idPhoto) async {
    try {
      final getPhoto = await _remoteDatasource.getPhoto(idPhoto);
      return Right(getPhoto);
    } on DioError catch(_){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PhotosResponse>> photos(int page) async {
    try {
      final getPhotos = await _remoteDatasource.getPhotos(page);
      return Right(getPhotos);
    } on DioError catch(_) {
      return Left(ServerFailure());
    }
  }

}
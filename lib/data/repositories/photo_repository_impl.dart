import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pexels/core/error/exceptions.dart';
import 'package:pexels/core/error/failures.dart';
import 'package:pexels/core/network/network_info.dart';
import 'package:pexels/data/datasources/photo_local_datasource.dart';
import 'package:pexels/data/datasources/photo_remote_datasource.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:pexels/domain/entities/photos_response.dart';
import 'package:pexels/domain/repositories/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDatasource _remoteDatasource;
  final PhotoLocalDatasource _localDatasource;
  final NetworkInfo _networkInfo;

  PhotoRepositoryImpl({
    @required PhotoRemoteDatasource remoteDatasource,
    @required PhotoLocalDatasource localDatasource,
    @required NetworkInfo networkInfo
  }): _remoteDatasource = remoteDatasource,
      _localDatasource = localDatasource,
      _networkInfo = networkInfo;

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
  Future<Either<Failure, List<Photo>>> photos(int page) async {
    final isConnected = await _networkInfo.isConnected;
    if(isConnected){
      try {
        final getPhotos = await _remoteDatasource.getPhotos(page);
        _localDatasource.savePhotos(getPhotos.photos);
        return Right(getPhotos.photos);
      } on DioError catch(_) {
        return Left(ServerFailure());
      }
    }
    else {
      try {
        final getPhotos = await _localDatasource.getPhotos();
        return Right(getPhotos);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

}
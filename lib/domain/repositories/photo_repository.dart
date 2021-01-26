import 'package:dartz/dartz.dart';
import 'package:pexels/core/error/failures.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:pexels/domain/entities/photos_response.dart';

abstract class PhotoRepository {
  Future<Either<Failure, PhotosResponse>> photos(int page);
  Future<Either<Failure, Photo>> photo(int idPhoto);
}
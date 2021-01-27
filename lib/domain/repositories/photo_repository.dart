import 'package:dartz/dartz.dart';
import 'package:pexels/core/error/failures.dart';
import 'package:pexels/domain/entities/photo.dart';

abstract class PhotoRepository {
  Future<Either<Failure, List<Photo>>> photos(int page);
  Future<Either<Failure, Photo>> photo(int idPhoto);
}
import 'package:pexels/domain/entities/photo.dart';

class PhotosResponse {
  PhotosResponse({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
  });

  int page;
  int perPage;
  List<Photo> photos;
  int totalResults;
  String nextPage;
}
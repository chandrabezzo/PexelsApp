import 'package:pexels/data/converter/photo_converter.dart';
import 'package:pexels/data/models/photos_response_model.dart';
import 'package:pexels/domain/entities/photos_response.dart';

class PhotoResponseConverter {
  static PhotosResponse convert(PhotosResponseModel model){
    return PhotosResponse(
      page: model.page,
      nextPage: model.nextPage,
      perPage: model.perPage,
      photos: PhotoConverter.converts(model.photos),
      totalResults: model.totalResults
    );
  }
}
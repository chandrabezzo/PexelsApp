import 'package:pexels/data/converter/src_converter.dart';
import 'package:pexels/data/models/photo_model.dart';
import 'package:pexels/domain/entities/photo.dart';

class PhotoConverter {
  static Photo convert(PhotoModel model){
    return Photo(
      id: model.id,
      height: model.height,
      avgColor: model.avgColor,
      liked: model.liked,
      photographer: model.photographer,
      photographerId: model.photographerId,
      photographerUrl: model.photographerUrl,
      src: SrcConverter.convert(model.src),
      url: model.url,
      width: model.width
    );
  }

  static List<Photo> converts(List<PhotoModel> models){
    final photos = List<Photo>();

    for(PhotoModel model in models){
      photos.add(Photo(
        width: model.width,
        url: model.url,
        src: SrcConverter.convert(model.src),
        photographerUrl: model.photographerUrl,
        photographerId: model.photographerId,
        photographer: model.photographer,
        liked: model.liked,
        avgColor: model.avgColor,
        height: model.height,
        id: model.id
      ));
    }
  }
}
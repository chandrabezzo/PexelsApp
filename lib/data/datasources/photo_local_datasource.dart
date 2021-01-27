import 'package:pexels/core/cache_helper.dart';
import 'package:pexels/core/error/exceptions.dart';
import 'package:pexels/data/converter/photo_converter.dart';
import 'package:pexels/data/converter/photo_model_converter.dart';
import 'package:pexels/data/models/photo_model.dart';
import 'package:pexels/domain/entities/photo.dart';

abstract class PhotoLocalDatasource {
  Future<List<Photo>> getPhotos();
  Future<bool> savePhotos(List<Photo> photos);
}

class PhotoLocalDatasourceImpl implements PhotoLocalDatasource {
  final CacheHelper cache;

  PhotoLocalDatasourceImpl(this.cache);

  @override
  Future<List<Photo>> getPhotos() async {
    final photos = await cache.getObject<Photo>((v){
      final model = PhotoModel.fromJson(v);
      return PhotoConverter.convert(model);
    }, defValue: null);
    return photos;
  }

  @override
  Future<bool> savePhotos(List<Photo> photos) async {
    final allPhoto = PhotoModelConverter.converts(photos);
    return await cache.putPhotos(allPhoto);
  }
}
import 'package:dio/dio.dart';
import 'package:pexels/core/network/endpoints.dart';
import 'package:pexels/core/network/headers_util.dart';
import 'package:pexels/data/converter/photo_converter.dart';
import 'package:pexels/data/converter/photo_response_converter.dart';
import 'package:pexels/data/models/photo_model.dart';
import 'package:pexels/data/models/photos_response_model.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:pexels/domain/entities/photos_response.dart';

abstract class PhotoRemoteDatasource {
  Future<PhotosResponse> getPhotos(int page);
  Future<Photo> getPhoto(int idPhoto);
}

class PhotoRemoteDatasourceImpl implements PhotoRemoteDatasource {
  @override
  Future<Photo> getPhoto(int idPhoto) async {
    final dio = Dio();

    final headers = await HeadersUtil.apiKey();

    final responseJson = await dio.get(
      "${Endpoints.PHOTOS}/$idPhoto",
      options: RequestOptions(
        headers: headers
      )
    );

    final photo = PhotoModel.fromJson(responseJson.data);
    return PhotoConverter.convert(photo);
  }

  @override
  Future<PhotosResponse> getPhotos(int page) async {
    final dio = Dio();

    final params = Map<String, dynamic>();
    params["page"] = page;

    final headers = await HeadersUtil.apiKey();

    final responseJson = await dio.get(
      Endpoints.PHOTOS,
      queryParameters: params,
      options: RequestOptions(
        headers: headers
      )
    );

    final photos = PhotosResponseModel.fromJson(responseJson.data);
    return PhotoResponseConverter.convert(photos);
  }

}
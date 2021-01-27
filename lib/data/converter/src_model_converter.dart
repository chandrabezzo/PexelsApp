import 'package:pexels/data/models/src_model.dart';
import 'package:pexels/domain/entities/src.dart';

class SrcModelConverter {
  static SrcModel convert(Src model){
    return SrcModel(
        landscape: model.landscape,
        large2X: model.large2X,
        large: model.large,
        medium: model.medium,
        original: model.original,
        portrait: model.portrait,
        small: model.small,
        tiny: model.tiny
    );
  }
}
import 'package:flutter/material.dart';
import 'package:pexels/domain/entities/src.dart';

class SrcModel extends Src {
  SrcModel({
    @required String original,
    @required String large2X,
    @required String large,
    @required String medium,
    @required String small,
    @required String portrait,
    @required String landscape,
    @required String tiny,
  }): super(
    original: original,
    tiny: tiny,
    small: small,
    portrait: portrait,
    medium: medium,
    large: large,
    large2X: large2X,
    landscape: landscape
  );

  factory SrcModel.fromJson(Map<String, dynamic> json) => SrcModel(
    original: json["original"],
    large2X: json["large2x"],
    large: json["large"],
    medium: json["medium"],
    small: json["small"],
    portrait: json["portrait"],
    landscape: json["landscape"],
    tiny: json["tiny"],
  );

  Map<String, dynamic> toJson() => {
    "original": original,
    "large2x": large2X,
    "large": large,
    "medium": medium,
    "small": small,
    "portrait": portrait,
    "landscape": landscape,
    "tiny": tiny,
  };
}
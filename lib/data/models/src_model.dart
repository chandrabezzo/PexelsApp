class SrcModel {
  SrcModel({
    this.original,
    this.large2X,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  String original;
  String large2X;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

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
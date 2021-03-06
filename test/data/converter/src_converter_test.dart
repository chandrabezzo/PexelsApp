import 'package:flutter_test/flutter_test.dart';
import 'package:pexels/data/converter/src_converter.dart';
import 'package:pexels/data/models/src_model.dart';
import 'package:pexels/domain/entities/src.dart';

void main(){
  test("Src Convert", (){
    final model = SrcModel(
      tiny: "test",
      small: "test",
      portrait: "test",
      original: "test",
      medium: "test",
      large: "test",
      large2X: "test",
      landscape: "test"
    );

    final photo = SrcConverter.convert(model);
    expect(photo, isA<Src>());
  });
}
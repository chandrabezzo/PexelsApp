import 'dart:io';

String jsonReader(String name) => File("test/util/$name").readAsStringSync();
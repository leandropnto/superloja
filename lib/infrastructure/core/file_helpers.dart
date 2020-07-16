import 'dart:io';

extension FileX on File {
  String get fileName => path.split(Platform.pathSeparator).last;
}
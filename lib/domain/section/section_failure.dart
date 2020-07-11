import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_failure.freezed.dart';

@freezed
abstract class SectionFailure with _$SectionFailure {
  const factory SectionFailure.serverError() = _ServerError;
}

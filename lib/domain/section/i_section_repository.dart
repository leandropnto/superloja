import 'package:dartz/dartz.dart';
import 'package:superloja/domain/section/section.dart';

import 'section_failure.dart';

abstract class ISectionRepository {
  Stream<Either<SectionFailure, List<Section>>> watchSections ();
  Future<Either<SectionFailure,  Section>> updateSection (Section section, int index);
  Future<Either<SectionFailure,  Section>> remove (Section section);
}
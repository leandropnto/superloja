import 'package:dartz/dartz.dart';
import 'package:superloja/domain/section/section.dart';

import 'section_failure.dart';

abstract class ISectionRepository {
  Stream<Either<SectionFailure, List<Section>>> watchProducts ();
}
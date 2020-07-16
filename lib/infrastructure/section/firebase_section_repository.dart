import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:superloja/domain/section/i_section_repository.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/domain/section/section_failure.dart';
import 'package:superloja/infrastructure/section/section_dto.dart';

@Singleton(as: ISectionRepository)
class FirebaseSectionRepository implements ISectionRepository {
  final Firestore _firestore;

  FirebaseSectionRepository(this._firestore) : assert(_firestore != null);

  @override
  Stream<Either<SectionFailure, List<Section>>> watchSections() async* {
    yield* _firestore.collection("home").snapshots().map(
          (snapshot) => right(
            snapshot.documents
                .map((doc) => SectionDto.fromFirestore(doc).toDomain())
                .toList(),
          ),
        );
  }
}

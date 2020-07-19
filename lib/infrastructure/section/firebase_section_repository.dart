import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:superloja/domain/section/i_section_repository.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/domain/section/section_failure.dart';
import 'package:superloja/domain/section/section_item.dart';
import 'package:superloja/infrastructure/section/section_dto.dart';
import 'package:uuid/uuid.dart';
import 'package:superloja/infrastructure/core/file_helpers.dart';

@Singleton(as: ISectionRepository)
class FirebaseSectionRepository implements ISectionRepository {
  final Firestore _firestore;
  final CollectionReference _home;
  final FirebaseStorage _storage;

  FirebaseSectionRepository(this._firestore, this._storage)
      : assert(_firestore != null),
        assert(_storage != null),
        _home = _firestore.collection("sections");

  @override
  Stream<Either<SectionFailure, List<Section>>> watchSections() async* {
    yield* _home.orderBy('order').snapshots().map(
          (snapshot) => right(
            snapshot.documents
                .map((doc) => SectionDto.fromFirestore(doc).toDomain())
                .toList(),
          ),
        );
  }

  @override
  Future<Either<SectionFailure, Section>> updateSection(Section section, int index) async {
    final reference = _storage.ref();
    try {
      final updated = await Future.wait(
        section.items.map((e) async {
          if (e.image is String) {
            return e;
          } else if (e.image is File) {
            final fileRef = reference
                .child("images/home/")
                .child("sections/${section.id}/")
                .child("${Uuid().v1()}_${(e.image as File).fileName}");
            await fileRef.putFile(e.image as File).onComplete;
            return SectionItem(
                product: e.product, image: await fileRef.getDownloadURL());
          } else {
            return e;
          }
        }).toList(),
      );

      _home.document(section.id).setData(
          SectionDto.fromDomain(section.copyWith(items: updated, order: index)).toMyJson());
      return right(section);
    } catch (e) {
      return left(const SectionFailure.serverError());
    }
  }

  @override
  Future<Either<SectionFailure, Section>> remove(Section section) async {
    try {
      section.items.forEach((e) async {
        final fileRef = await _storage.getReferenceFromUrl(e.image as String);
        await fileRef.delete();
      });
      await _storage
          .ref()
          .child("images/home/")
          .child("sections/${section.id}/")
          .delete();

      await _home.document(section.id).delete();
      return right(section);
    } on PlatformException catch (e) {
      if (e.code == "Error -13010") {
        //arquivo nao existe
        await _home.document(section.id).delete();
        return right(section);
      } else {
        return left(const SectionFailure.serverError());
      }
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:superloja/domain/cep/address.dart';
import 'package:superloja/domain/core/failures.dart';

import 'value_objects.dart';

abstract class ICepService {
  Future<Either<ValueFailure, Address>> getAddressFromCep(Cep cep);

}
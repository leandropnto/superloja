import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:superloja/domain/cep/address.dart';
import 'package:superloja/domain/cep/i_cep_service.dart';
import 'package:superloja/domain/cep/value_objects.dart';
import 'package:superloja/domain/core/failures.dart';

const token = "0d80e5056753e52e63f0d0b32335ed5b";

@Singleton(as: ICepService)
class CepAbertoService implements ICepService {
  @override
  Future<Either<ValueFailure, Address>> getAddressFromCep(Cep cep) async {
    final cleanCep = cep.cleanValue();
    final endpoint = "https://www.cepaberto.com/api/v3/cep?cep=$cleanCep";

    final Dio dio = Dio();
    dio.options.headers[HttpHeaders.authorizationHeader] = 'Token token=$token';

    try {
      final response = await dio.get<Map<String, dynamic>>(endpoint);
      if (response.data.isEmpty) {
        return left(ValueFailure.invalidCep(cep.cleanValue()));
      }

      return right(Address.fromJson(response.data));
    } on DioError catch (e) {
      return left(ValueFailure.invalidCep(cep.cleanValue()));
    }
  }

}
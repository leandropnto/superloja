import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:superloja/infrastructure/cep/cep_aberto_service.dart';

import 'domain/cep/value_objects.dart';
import 'injection.dart';

import 'presentation/core/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  runApp(AppWidget());
}

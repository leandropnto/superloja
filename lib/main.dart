import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:superloja/presentation/home/home_page.dart';

import 'injection.dart';
import 'package:injectable/injectable.dart';

import 'presentation/core/app_widget.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(AppWidget());
}

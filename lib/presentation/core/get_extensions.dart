import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

void showAppSnackBar(String message, {String title = "Super Loja"}) {
  Get.snackbar("Super Loja", "Erro efetuando o login",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 7),
      backgroundColor: kAlertColor,
      margin: EdgeInsets.zero,
      borderRadius: 0,
      colorText: Colors.white);
}

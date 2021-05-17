import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ipresent/app/locator.dart';
import 'package:get/get.dart';
import 'package:stacked_services/stacked_services.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();
  // Registers a config to be used when calling showSnackbar
  // service.registerSnackbarConfig(SnackbarConfig(
  //   backgroundColor: AppColors.error,
  //   animationDuration: Duration(milliseconds: 400),
  //   isDismissible: true,
  //   maxWidth: double.infinity,
  //   snackPosition: SnackPosition.TOP,
  // ));
  service.registerCustomSnackbarConfig(
      variant: SnackbarType.Success,
      config: SnackbarConfig(
        isDismissible: true,
        animationDuration: Duration(seconds: 2),
        backgroundColor: Color(0xFF2AA952),
        textColor: Colors.white,
        borderRadius: 1,
        forwardAnimationCurve: Curves.bounceIn,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        // leftBarIndicatorColor: Color(0xFFDB3022),
      ));
  service.registerCustomSnackbarConfig(
      variant: SnackbarType.Error,
      config: SnackbarConfig(
        isDismissible: true,
        backgroundColor: Color(0xFFDB3022),
        animationDuration: Duration(seconds: 2),
        textColor: Colors.white,
        borderRadius: 1,
        forwardAnimationCurve: Curves.bounceIn,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
      ));
}

enum SnackbarType { Success, Error, Warning }

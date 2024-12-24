import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

void customErrorTopSnackBar(BuildContext context, String message) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: message,
    ),
  );
}

void customSuccessTopSnackBar(BuildContext context, String message) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: message,
    ),
  );
}

void customInfoTopSnackBar(BuildContext context, String message) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.info(
      message: message,
    ),
  );
}

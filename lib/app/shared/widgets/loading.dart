import 'package:flutter/material.dart';
import 'package:compregados_app_v2/app/shared/colors.dart';
// import 'package:lottie/lottie.dart' as lottie;

loadingCircular() {
  return Container(
    color: Colors.white,
    child: const Center(child: CircularProgressIndicator(color: primary)),
  );
}

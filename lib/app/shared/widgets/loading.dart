import 'package:flutter/material.dart';
import 'package:laserfast_app/app/shared/colors.dart';
// import 'package:lottie/lottie.dart' as lottie;

loadingCircular() {
  return Container(
    color: Colors.white,
    child: const Center(child: CircularProgressIndicator(color: primary)),
  );
}

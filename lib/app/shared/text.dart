import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget textWidget(
  String? text, {
  double? fontSize,
  FontWeight? fontWeight = FontWeight.w500,
  Color? color = black,
  TextStyle? style,
  TextAlign? textAlign,
  int maxLines = 2,
  overflow = TextOverflow.ellipsis,
}) {
  return AutoSizeText(
    text ?? "",
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    minFontSize: 10,
    style: style ??
        GoogleFonts.inter(
          fontSize: fontSize ?? 16.0.sp,
          fontWeight: fontWeight,
          color: color,
        ),
  );
}

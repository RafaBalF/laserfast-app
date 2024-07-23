import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RedirectCardWidget extends StatelessWidget {
  final String imgPath;
  final String label;
  final String route;
  final Color? labelColor;
  final EdgeInsets? margin;

  const RedirectCardWidget({
    super.key,
    required this.imgPath,
    required this.label,
    required this.route,
    this.labelColor,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 11.5.h,
      margin: margin,
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: accent),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 2.h),
              SvgPicture.asset(
                imgPath,
                height: 4.h,
              ),
              SizedBox(height: 1.h),
              textWidget(
                label,
                textAlign: TextAlign.center,
                style: profileTile(color: labelColor ?? black),
                maxLines: 2,
              ),
            ],
          ),
        ),
        onTap: () {
          Modular.to.pushNamed(route);
        },
      ),
    );
  }
}

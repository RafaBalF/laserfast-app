import 'package:laserfast_app/app/models/base.model.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future showCustomBottomSheet(
  BuildContext context,
  String header,
  Widget widget,
) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(header, style: modalHeader(color: black)),
                  IconButton(
                      onPressed: () {
                        Modular.to.pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: accent,
                        size: 32,
                      ))
                ],
              ),
            ),
            Center(
              child: widget,
            ),
          ],
        );
      });
}

Future showErrorBottomSheet(
  BuildContext context, {
  String message = 'Ocorreu um erro ao executar a ação',
  String details = '',
  String btnTitle = 'OK',
  Function()? onPressed,
}) {
  Widget widget = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      DividerWidget(height: 5.h),
      Image.asset('assets/icons/error.png'),
      DividerWidget(height: 5.h),
      textWidget(message, style: modalHeader()),
      DividerWidget(height: 5.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: textWidget(
          details,
          style: modalDetails(color: darkerGrey),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ),
      DividerWidget(height: 5.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ButtonWidget.filled(
          title: btnTitle,
          onPressed: onPressed ??
              () {
                Modular.to.pop();
              },
          backgroundColor: accent,
          textColor: white,
        ),
      )
    ],
  );

  return showCustomBottomSheet(context, 'ERRO', widget);
}

Future showSuccessBottomSheet(
  BuildContext context, {
  String message = 'Ação realizada com sucesso',
  String details = '',
  String btnTitle = 'OK',
  Function()? onPressed,
}) {
  Widget widget = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      DividerWidget(height: 5.h),
      Image.asset('assets/icons/success.png'),
      DividerWidget(height: 5.h),
      textWidget(message, style: modalHeader()),
      DividerWidget(height: 5.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: textWidget(
          details,
          style: modalDetails(color: darkerGrey),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ),
      DividerWidget(height: 5.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ButtonWidget.filled(
          title: btnTitle,
          onPressed: onPressed ??
              () {
                Modular.to.pop();
              },
          backgroundColor: accent,
          textColor: white,
        ),
      )
    ],
  );

  return showCustomBottomSheet(context, 'SUCESSO', widget);
}

Future showBaseModalBottomSheet(
  BuildContext context,
  BaseModel baseModel, {
  Function()? onSuccessPressed,
  Function()? onErrorPressed,
}) {
  if (baseModel.status) {
    return showSuccessBottomSheet(
      context,
      message: baseModel.message,
      onPressed: onSuccessPressed,
    );
  }

  return showErrorBottomSheet(
    context,
    message: baseModel.message,
    onPressed: onErrorPressed,
  );
}

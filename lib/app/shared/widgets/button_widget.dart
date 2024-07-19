import 'package:laserfast_app/app/shared/text.dart';
import 'package:flutter/material.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/enums/button_sizes.enum.dart';
import 'package:laserfast_app/app/shared/enums/button_types.enum.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonWidget extends StatefulWidget {
  final Function()? onPressed;
  final bool disabled;
  final bool loading;
  final ButtonType buttonType;
  final ButtonSize buttonSize;
  final String? title;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? iconData;
  final double? iconSize;
  final Color? iconColor;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.disabled,
    required this.loading,
    required this.buttonType,
    required this.buttonSize,
    this.borderColor,
    this.backgroundColor,
    this.title,
    this.textColor,
    this.iconData,
    this.iconSize,
    this.iconColor,
  });

  factory ButtonWidget.filled({
    required Function()? onPressed,
    required Color? backgroundColor,
    required String title,
    required Color? textColor,
    bool disabled = false,
    bool loading = false,
    ButtonSize buttonSize = ButtonSize.large,
  }) =>
      ButtonWidget(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        title: title,
        textColor: textColor,
        disabled: disabled,
        loading: loading,
        buttonSize: buttonSize,
        buttonType: ButtonType.filled,
      );

  factory ButtonWidget.outlined({
    required Function()? onPressed,
    required Color? borderColor,
    required String title,
    required Color? textColor,
    bool loading = false,
    bool disabled = false,
    ButtonSize buttonSize = ButtonSize.large,
  }) =>
      ButtonWidget(
        onPressed: onPressed,
        borderColor: borderColor,
        title: title,
        textColor: textColor,
        disabled: disabled,
        loading: loading,
        buttonSize: buttonSize,
        buttonType: ButtonType.outlined,
      );

  factory ButtonWidget.filledIcon({
    required Function()? onPressed,
    required Color? backgroundColor,
    required IconData? iconData,
    required Color? iconColor,
    double? iconSize,
    bool disabled = false,
    bool loading = false,
    ButtonSize buttonSize = ButtonSize.large,
  }) =>
      ButtonWidget(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        iconData: iconData,
        iconColor: iconColor,
        iconSize: iconSize,
        disabled: disabled,
        loading: loading,
        buttonSize: buttonSize,
        buttonType: ButtonType.filledIcon,
      );

  factory ButtonWidget.outlinedIcon({
    required Function()? onPressed,
    required Color? borderColor,
    required IconData? iconData,
    required Color? iconColor,
    double? iconSize = 18,
    bool disabled = false,
    bool loading = false,
    ButtonSize buttonSize = ButtonSize.large,
  }) =>
      ButtonWidget(
        onPressed: onPressed,
        disabled: disabled,
        borderColor: borderColor,
        loading: loading,
        buttonSize: buttonSize,
        iconData: iconData,
        iconColor: iconColor,
        iconSize: iconSize,
        buttonType: ButtonType.outlinedIcon,
      );

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  late double height;
  late double width;
  late double radius;

  @override
  void initState() {
    height = 6.h;
    width = 90.w;
    radius = 10;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.loading) {
      return _loading();
    }

    switch (widget.buttonType) {
      case ButtonType.filled:
        return _filled();
      case ButtonType.outlined:
        return _outlined();
      case ButtonType.filledIcon:
        return _filledIcon();
      case ButtonType.outlinedIcon:
        return _outlinedIcon();
      default:
        return _filled();
    }
  }

  Widget _loading() {
    return Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: Center(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: const CircularProgressIndicator(color: accent)),
      ),
    );
  }

  Widget _filled() {
    Color? backgroundColor = widget.backgroundColor;
    Color? textColor = widget.textColor;

    if (widget.disabled) {
      backgroundColor = grey;
      textColor = darkGrey;
    }

    return ElevatedButton(
      onPressed: _getFunction(),
      style: _getStyle(
        WidgetStateProperty.all(backgroundColor),
        BorderSide.none,
      ),
      child: _getText(textColor),
    );
  }

  Widget _outlined() {
    Color? borderColor = widget.borderColor;
    Color? textColor = widget.textColor;

    if (widget.disabled) {
      borderColor = grey;
      textColor = grey;
    }

    return ElevatedButton(
      onPressed: _getFunction(),
      style: _getStyle(
        WidgetStateProperty.all(Colors.transparent),
        BorderSide(width: 2, color: borderColor!),
      ),
      child: _getText(textColor),
    );
  }

  Widget _filledIcon() {
    Color? backgroundColor = widget.backgroundColor;
    Color? iconColor = widget.iconColor;

    if (widget.disabled) {
      backgroundColor = grey;
      iconColor = darkGrey;
    }

    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: backgroundColor!),
          borderRadius: BorderRadius.circular(radius)),
      child: IconButton(
        onPressed: _getFunction(),
        icon: Icon(
          widget.iconData,
          size: widget.iconSize,
        ),
        color: iconColor,
      ),
    );
  }

  Widget _outlinedIcon() {
    Color? borderColor = widget.borderColor;
    Color? iconColor = widget.iconColor;

    if (widget.disabled) {
      borderColor = grey;
      iconColor = darkGrey;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 2, color: borderColor!),
      ),
      child: IconButton(
        onPressed: _getFunction(),
        icon: Icon(widget.iconData),
        color: iconColor,
      ),
    );
  }

  Function()? _getFunction() {
    return widget.disabled ? null : widget.onPressed;
  }

  ButtonStyle _getStyle(
    WidgetStateProperty<Color?> backgroundColor,
    BorderSide borderSide,
  ) {
    switch (widget.buttonSize) {
      case ButtonSize.large:
        break;
      case ButtonSize.medium:
        height = 5.h;
        break;
      case ButtonSize.small:
        height = 3.h;
        break;
      default:
        break;
    }

    return ButtonStyle(
      elevation: WidgetStateProperty.all(0),
      minimumSize: WidgetStateProperty.all(Size(width, height)),
      maximumSize: WidgetStateProperty.all(Size(width, height)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: borderSide,
      )),
      backgroundColor: backgroundColor,
    );
  }

  Widget _getText(Color? textColor) {
    return textWidget(
      widget.title,
      style: headTitle(color: textColor),
    );
  }
}

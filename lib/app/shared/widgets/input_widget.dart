import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:compregados_app_v2/app/shared/colors.dart';
import 'package:compregados_app_v2/app/shared/text.dart';
import 'package:compregados_app_v2/app/shared/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputWidget extends StatefulWidget {
  final String text;
  final Color? textColor;
  final double? width;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final double? height;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? maxLength;
  final bool? enabled;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? value;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? margin;
  final String? error;
  final String? placeholder;
  final TextAlignVertical? textAlignVertical;
  final double? fontSize;
  final double contentPaddingBot;
  final double contentPaddingTop;
  const InputWidget(
      {super.key,
      required this.text,
      this.textColor,
      this.controller,
      this.height,
      this.width,
      this.keyboardType,
      this.maxLines = 1,
      this.maxLength,
      this.enabled = true,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.value,
      this.inputFormatters,
      this.textInputAction,
      this.margin,
      this.placeholder,
      this.error,
      this.textAlignVertical,
      this.fontSize = 16,
      this.contentPaddingBot = 16,
      this.contentPaddingTop = 16});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _textEditingController = TextEditingController(text: widget.value);
      if (widget.maxLength != null) {
        _textEditingController.addListener(() {
          setState(() {});
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.margin != null ? _withMargin() : _input();
  }

  _withMargin() {
    return Container(margin: widget.margin, child: _input());
  }

  Widget _input() {
    return SizedBox(
      width: widget.width ?? 90.w,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: textWidget(widget.text,
                style: label(color: widget.textColor ?? white)),
          ),
          SizedBox(height: 1.h),
          SizedBox(
            height: widget.height,
            child: TextField(
              style: TextStyle(
                fontSize: widget.fontSize?.sp,
                color: darkerGrey,
                height: 1,
              ),
              cursorColor: primary,
              textAlignVertical: widget.textAlignVertical,
              enabled: widget.enabled,
              onChanged: widget.onChanged,
              controller: widget.controller ?? _textEditingController,
              obscureText: widget.obscureText,
              maxLines: widget.maxLines,
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              textInputAction: widget.textInputAction ?? TextInputAction.next,
              decoration: _decoration(),
            ),
          )
        ],
      ),
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      isDense: true,
      fillColor: (widget.enabled == true) ? white : grey,
      filled: true,
      contentPadding: EdgeInsets.only(
        top: widget.contentPaddingTop,
        bottom: widget.contentPaddingBot,
        left: 10,
        right: 10,
      ),
      suffixIcon: widget.suffixIcon,
      prefixIcon: widget.prefixIcon,
      errorText: widget.error,
      hintText: widget.placeholder,
      disabledBorder: _border(color: grey),
      enabledBorder: _border(),
      focusedBorder: _border(),
      errorBorder: _border(color: error),
      border: _border(),
      focusedErrorBorder: _border(color: error),
    );
  }

  OutlineInputBorder _border({Color? color}) {
    double borderWidth = 1;
    double gapPadding = 10;
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: borderWidth,
        color: (color != null) ? color : white,
      ),
      gapPadding: gapPadding,
    );
  }
}

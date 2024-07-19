import 'package:flutter/material.dart';
import 'package:compregados_app_v2/app/shared/colors.dart';
import 'package:compregados_app_v2/app/shared/widgets/input_widget.dart';

class PasswordInputWidget extends StatefulWidget {
  final String? label;
  final Function(String)? onChanged;
  final bool passwordVisibility;
  final void Function()? onTap;
  final String? error;
  const PasswordInputWidget({
    super.key,
    this.label,
    required this.onChanged,
    required this.passwordVisibility,
    required this.onTap,
    this.error,
  });

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  @override
  Widget build(BuildContext context) {
    return InputWidget(
      text: widget.label ?? 'Senha',
      onChanged: widget.onChanged,
      obscureText: !widget.passwordVisibility,
      suffixIcon: GestureDetector(
        onTap: widget.onTap,
        child: Icon(
          widget.passwordVisibility
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: darkGrey,
          size: 24,
        ),
      ),
      error: widget.error,
    );
  }
}

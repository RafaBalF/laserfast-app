import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:compregados_app_v2/app/shared/colors.dart';
import 'package:compregados_app_v2/app/shared/text_styles.dart';

class CreateAccountWidget extends StatefulWidget {
  final Color? textColor;
  final Color? linkColor;
  const CreateAccountWidget({
    super.key,
    this.textColor,
    this.linkColor,
  });

  @override
  State<CreateAccountWidget> createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Ainda não tem uma conta? ',
          style: text(color: widget.textColor ?? black),
        ),
        GestureDetector(
          onTap: () {
            Modular.to.pushNamed('/auth/register');
          },
          child: Container(
            decoration: BoxDecoration(
                border: BorderDirectional(
              bottom: BorderSide(color: widget.linkColor ?? accent),
            )),
            child: Text(
              'CRIAR CONTA',
              style: label(color: widget.linkColor ?? accent),
            ),
          ),
        )
      ],
    );
  }
}

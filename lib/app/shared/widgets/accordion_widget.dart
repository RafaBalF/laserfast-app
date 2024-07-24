import 'package:flutter/material.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';

class AccordionWidget extends StatelessWidget {
  final String label;
  final Widget content;

  const AccordionWidget({
    super.key,
    required this.label,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: const Border(),
      collapsedIconColor: accent,
      title: textWidget(label),
      children: <Widget>[content],
    );
  }
}

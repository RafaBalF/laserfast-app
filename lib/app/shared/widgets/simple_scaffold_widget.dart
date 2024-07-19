import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:compregados_app_v2/app/shared/colors.dart';
import 'package:compregados_app_v2/app/shared/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SimpleScaffoldWidget extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget? progress;
  final Widget? floatingActionButton;
  final List<Widget>? actions;
  final bool? drawer;
  final bool loading;
  final Widget? bottomNavigationBar;
  const SimpleScaffoldWidget({
    super.key,
    this.title = "",
    required this.body,
    this.progress,
    this.floatingActionButton,
    this.actions,
    this.drawer = true,
    this.loading = false,
    this.bottomNavigationBar,
  });

  @override
  State<SimpleScaffoldWidget> createState() => _SimpleScaffoldWidgetState();
}

class _SimpleScaffoldWidgetState extends State<SimpleScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: white,
            ),
            onPressed: () {
              if (Modular.to.canPop()) {
                Modular.to.pop();
              }
            },
          ),
        ),
        centerTitle: true,
        backgroundColor: primary,
        title: Text(
          widget.title,
          style: headTitle(color: white),
        ),
        elevation: 0,
        // toolbarHeight: 6.1.h,
        actions: widget.actions,
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        alignment: Alignment.topLeft,
        color: primary,
        padding: const EdgeInsets.only(top: 0),
        child: widget.body,
      ),
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laserfast_app/app/modules/home/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:laserfast_app/app/modules/home/widgets/main_scaffold/main_scaffold_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainScaffoldWidget extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget? progress;
  final Widget? floatingActionButton;
  final List<Widget>? actions;
  final bool? drawer;
  final bool loading;

  const MainScaffoldWidget({
    super.key,
    this.title = "",
    required this.body,
    this.progress,
    this.floatingActionButton,
    this.actions,
    this.drawer = true,
    this.loading = false,
  });

  @override
  State<MainScaffoldWidget> createState() => _MainScaffoldWidgetState();
}

class _MainScaffoldWidgetState extends State<MainScaffoldWidget> {
  final MainScaffoldStore _store = Modular.get<MainScaffoldStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Image.asset('assets/icons/ic_launcher.png'),
        ),
        centerTitle: true,
        backgroundColor: white,
        title: Center(child: _title()),
        elevation: 0,
        actions: [
          _padding(
            GestureDetector(
              child: SvgPicture.asset('assets/icons/svg/user.svg'),
              onTap: () => Modular.to.pushNamed('/home/profile'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          width: 100.w,
          alignment: Alignment.topLeft,
          color: white,
          padding: EdgeInsets.only(left: 5.w),
          child: widget.body,
        ),
      ),
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }

  Widget _title() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textWidget(
            'Aviso',
            style: label(color: darkGrey),
          ),
          textWidget(
            'Você tem pendência',
            style: headTitle(color: accent),
          ),
        ],
      ),
    );
  }

  Widget _padding(Widget child) {
    return Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: child,
    );
  }
}

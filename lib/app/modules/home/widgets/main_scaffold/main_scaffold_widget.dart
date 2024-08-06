import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laserfast_app/app/modules/home/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:laserfast_app/app/modules/home/widgets/main_scaffold/main_scaffold_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
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
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.init()]);

    super.initState();
  }

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
              child: SvgPicture.asset('assets/icons/svg/user_accent.svg'),
              onTap: () => Modular.to.pushNamed('/profile/'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          alignment: Alignment.topLeft,
          color: background,
          padding: EdgeInsets.only(left: 5.w),
          child: Flex(
            direction: Axis.vertical,
            children: [widget.body, DividerWidget(height: 5.h)],
          ),
        ),
      ),
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }

  Widget _title() {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return _loaded();
        } else {
          return _loading();
        }
      },
    );
  }

  Widget _loading() {
    return Column(
      children: [
        ShimmerWidget(width: 20.w, height: 2.h),
        DividerWidget(height: 1.h),
        ShimmerWidget(width: 40.w, height: 2.h),
      ],
    );
  }

  Widget _loaded() {
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

  @override
  void dispose() {
    _store.reset();

    super.dispose();
  }
}

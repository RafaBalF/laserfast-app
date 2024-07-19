import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/home/pages/initial/inital_store.dart';
import 'package:laserfast_app/app/shared/widgets/custom_future_builder_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InitialPage extends StatefulWidget {
  final String title;
  const InitialPage({super.key, this.title = 'InitialPage'});
  @override
  InitialPageState createState() => InitialPageState();
}

class InitialPageState extends State<InitialPage> {
  final InitialStore _store = Modular.get<InitialStore>();
  late final Future _myFuture;

  @override
  void initState() {
    super.initState();
    _myFuture = Future.wait([
      _store.init(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilderWidget(
      future: _myFuture,
      finalWidget: _mainBody(),
      loadingWidget: _loadingBody(),
    );
  }

  Widget _mainBody() {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ..._background(),
          _mainContent(),
        ],
      ),
    );
  }

  List<Widget> _background() {
    return [
      Positioned.fill(
        child: Container(color: background),
      ),
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
                bottom: Radius.elliptical(500, 100)),
            child: Image.asset(
              'assets/images/home_background.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      )
    ];
  }

  Widget _mainContent() {
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DividerWidget(height: 10.h),
          _header(),
          DividerWidget(height: 2.h),
          //@TODO: lista de categorias
          DividerWidget(height: 100.h),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Bem vindo ao \n',
              style: homeHeader(color: white),
              children: <TextSpan>[
                TextSpan(
                    text: 'Compre gados', style: homeHeader(color: accent)),
              ],
            ),
          ),
          DividerWidget(height: 1.h),
          textWidget(
            'Anuncie ou busque o que quiser de forma fácil e rápida pelo compre gados!',
            style: label(color: white),
          ),
        ],
      ),
    );
  }

  Widget _loadingBody() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DividerWidget(height: 10.h),
          ShimmerWidget(width: 50.w, height: 7.5.h),
          DividerWidget(height: 2.h),
          ShimmerWidget(width: 70.w, height: 5.h),
          DividerWidget(height: 3.h),
          SizedBox(
            height: 10.h,
            width: 100.w,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(right: 3.w),
                  child: ShimmerWidget(width: 20.w, height: 10.h),
                );
              },
            ),
          ),
          DividerWidget(height: 3.h),
          SizedBox(
            height: 5.h,
            width: 90.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShimmerWidget(width: 70.w, height: 4.h),
                ShimmerWidget(width: 15.w, height: 5.h),
              ],
            ),
          ),
          DividerWidget(height: 3.h),
          SizedBox(
            height: 25.h,
            width: 100.w,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: ShimmerWidget(width: 50.w, height: 10.h),
                );
              },
            ),
          ),
          DividerWidget(height: 3.h),
          ShimmerWidget(width: 90.w, height: 15.h),
        ],
      ),
    );
  }
}

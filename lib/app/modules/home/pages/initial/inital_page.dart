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
      finalWidget: Container(),
      loadingWidget: _loadingBody(),
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

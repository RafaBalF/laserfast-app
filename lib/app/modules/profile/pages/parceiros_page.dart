import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/profile/profile_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ParceirosPage extends StatefulWidget {
  const ParceirosPage({super.key});
  @override
  ParceirosPageState createState() => ParceirosPageState();
}

class ParceirosPageState extends State<ParceirosPage> {
  final ProfileStore _store = Modular.get<ProfileStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.initParceiros()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'DADOS PESSOAIS',
            useDefaultPadding: false,
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return _body();
                } else {
                  return _loadingBody();
                }
              },
            ));
      },
    );
  }

  Widget _loadingBody() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          6,
          (index) => Column(
            children: [
              ShimmerWidget(width: 90.w, height: 6.h),
              DividerWidget(height: 1.h),
              ShimmerWidget(width: 90.w, height: 2.h),
              DividerWidget(height: 1.h),
              ShimmerWidget(width: 90.w, height: 2.h),
              DividerWidget(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.80,
        children: _getTiles().map((t) => t).toList(),
      ),
    );
  }

  List<Widget> _getTiles() {
    return [
      _tileCard(
        'assets/images/profile/duckbill.png',
        "A Duckbill é a Casa do Melhor Cookie do Brasil e Cafés Especiais.",
        () => launchUrlString(""),
      ),
      _tileCard(
        'assets/images/profile/duckbill.png',
        "A Duckbill é a Casa do Melhor Cookie do Brasil e Cafés Especiais.",
        () => launchUrlString(""),
      ),
      _tileCard(
        'assets/images/profile/duckbill.png',
        "A Duckbill é a Casa do Melhor Cookie do Brasil e Cafés Especiais.",
        () => launchUrlString(""),
      ),
      _tileCard(
        'assets/images/profile/duckbill.png',
        "A Duckbill é a Casa do Melhor Cookie do Brasil e Cafés Especiais.",
        () => launchUrlString(""),
      ),
    ];
  }

  Widget _tileCard(
    String imgPath,
    String title,
    Function()? onTap, {
    int maxLines = 4,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: grey,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100.w,
              child: Image.asset(imgPath, fit: BoxFit.cover),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5.w),
              child: textWidget(
                title,
                style: profileTile(),
                maxLines: maxLines,
              ),
            ),
            SizedBox(height: 2.h),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: SizedBox(
                      height: 3.h,
                      width: 100.w,
                      child: ElevatedButton(
                        onPressed: onTap,
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(accent),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        child: textWidget(
                          'ACESSAR',
                          style: headTitle(color: white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

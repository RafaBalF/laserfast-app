import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/models/parceiro.model.dart';
import 'package:laserfast_app/app/modules/parceiros/parceiros_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
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
  final ParceirosStore _store = Modular.get<ParceirosStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.getParceiros()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return SimpleScaffoldWidget(
            title: 'PARCEIROS',
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: SizedBox(
                height: 100.h,
                width: 100.w,
                child: (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData)
                    ? Observer(
                        builder: (_) => GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.80,
                          mainAxisSpacing: 1.h,
                          crossAxisSpacing: 2.w,
                          children: _store.parceiros
                              .map((p) => _tileCard(p))
                              .toList(),
                        ),
                      )
                    : _loadingBody()),
          );
        });
  }

  Widget _loadingBody() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1,
      mainAxisSpacing: 1.h,
      crossAxisSpacing: 2.w,
      children: [
        ShimmerWidget(width: 40.w, height: 10.h),
        ShimmerWidget(width: 40.w, height: 10.h),
        ShimmerWidget(width: 40.w, height: 10.h),
        ShimmerWidget(width: 40.w, height: 10.h),
      ],
    );
  }

  Widget _tileCard(ParceiroModel p) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: grey,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100.w,
            height: 12.5.h,
            child: Image.network(p.imagem ?? "", fit: BoxFit.cover),
          ),
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
            child: textWidget(
              p.descricao,
              style: profileTile(),
              maxLines: 5,
            ),
          ),
          // SizedBox(height: 1.h),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  child: SizedBox(
                    height: 3.h,
                    width: 100.w,
                    child: ElevatedButton(
                      onPressed: () => launchUrlString(p.link ?? ""),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(primary),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
    );
  }
}

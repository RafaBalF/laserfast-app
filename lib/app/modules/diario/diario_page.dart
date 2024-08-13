import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/diario/diario_store.dart';
import 'package:laserfast_app/app/modules/diario/widgets/map_item.dart';
import 'package:laserfast_app/app/shared/interfaces/position.interface.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DiarioPage extends StatefulWidget {
  const DiarioPage({super.key});
  @override
  DiarioPageState createState() => DiarioPageState();
}

class DiarioPageState extends State<DiarioPage> {
  final DiarioStore _store = Modular.get<DiarioStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.initDiario()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: Colors.red,
              width: 100.w,
              height: 100.h,
              child: Observer(
                builder: (_) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return _body();
                  } else {
                    return _loadingBody();
                  }
                },
              ),
            ),
          ),
        );
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
    return Stack(
      children: [
        Image.asset(
          width: 100.w,
          height: 100.h,
          'assets/images/diario/background.png',
          fit: BoxFit.fitHeight,
        ),
        MapItem.estrela(
          onPressed: () {},
          position: PositionInterface(
            bottom: 1.h,
            height: 10.h,
            width: 20.w,
            right: 2.w,
          ),
          desbloqueado: false,
          usado: false,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _store.resetDiario();

    super.dispose();
  }
}

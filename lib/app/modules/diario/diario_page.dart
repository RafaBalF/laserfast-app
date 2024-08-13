import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laserfast_app/app/modules/diario/diario_store.dart';
import 'package:laserfast_app/app/modules/diario/widgets/map_item.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/enums/button_sizes.enum.dart';
import 'package:laserfast_app/app/shared/interfaces/position.interface.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
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

  int introPage = 0;

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
        ..._items(),
        ..._intro(),
      ],
    );
  }

  List<Widget> _items() {
    return [
      MapItem.estrela(
        onPressed: () {},
        position: PositionInterface(
          bottom: 3.h,
          right: 12.w,
        ),
        desbloqueado: false,
        usado: false,
      ),
    ];
  }

  List<Widget> _intro() {
    if (_store.viuIntro) return [];

    if (introPage == 0) {
      return [
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            height: 60.h,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DividerWidget(height: 5.h),
                    SvgPicture.asset('assets/images/diario/intro-1.svg'),
                    _avancar(
                      () => setState(() {
                        introPage = 1;
                      }),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/diario/fly.png',
                  fit: BoxFit.fitHeight,
                )
              ],
            ),
          ),
        ),
      ];
    }

    if (introPage == 1) {
      return [
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            height: 60.h,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DividerWidget(height: 5.h),
                    SvgPicture.asset('assets/images/diario/intro-2.svg'),
                    _avancar(
                      () => setState(() {
                        introPage = 2;
                        _store.verIntro;
                      }),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/diario/fly.png',
                  fit: BoxFit.fitHeight,
                )
              ],
            ),
          ),
        ),
      ];
    }

    return [];
  }

  Widget _avancar(Function()? onPressed) {
    return ButtonWidget.filled(
      onPressed: onPressed,
      backgroundColor: accent,
      title: 'AVANÇAR >',
      textColor: white,
      buttonSize: ButtonSize.medium,
      width: 40.w,
    );
  }

  @override
  void dispose() {
    _store.resetDiario();

    super.dispose();
  }
}

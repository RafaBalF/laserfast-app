import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:laserfast_app/app/models/session.model.dart';
import 'package:laserfast_app/app/modules/historico/historico_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});
  @override
  HistoricoPageState createState() => HistoricoPageState();
}

class HistoricoPageState extends State<HistoricoPage> {
  final HistoricoStore _store = Modular.get<HistoricoStore>();
  late final Future<void> _future;
  final ScrollController scrollController = ScrollController();

  final double _height = 100.h;
  final double _width = 100.w;

  final DateFormat sessionDateFormatter = DateFormat("dd/MM/yyyy 'as' HH:mm");

  final realizada = const Color(0XFF65A491);
  final falta = const Color(0xFFCB91D1);
  final agendada = const Color(0XFFDDD2D2);
  final andamento = const Color(0XFFE8C691);
  final confirmada = const Color(0XFF817FF0);
  final padrao = const Color(0XFF2B2B2B);

  @override
  void initState() {
    _future = Future.wait([_store.init()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'HISTÓRICO DE SESSÕES',
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Observer(builder: (_) {
                    return SizedBox(
                      height: _height,
                      width: _width,
                      child: ListView.builder(
                        itemCount: _store.history.length,
                        itemBuilder: (context, index) =>
                            _sessionCard(_store.history[index]),
                      ),
                    );
                  });
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

  Widget _sessionCard(SessionModel session) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10.w,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _getColor(session.statusCode!),
                  ),
                  child: const SizedBox(),
                ),
              ),
              SizedBox(width: 2.5.w),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                          '${session.status}',
                          style: label(),
                        ),
                        textWidget(
                          sessionDateFormatter.format(session.date!),
                          style: small(),
                        ),
                      ],
                    ),
                    DividerWidget(height: 0.5.h),
                    textWidget(
                      '${session.areas}',
                      style: small(),
                    ),
                    textWidget(
                      'Aplicador(a): ${session.applicator}',
                      style: small(),
                    ),
                    DividerWidget(height: 0.5.h),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100.w,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              _getStatusWidget(session.statusCode!),
            ]),
          ),
        ],
      ),
    );
  }

  Color _getColor(int statusCode) {
    switch (statusCode) {
      case 0:
        return realizada;
      case 1:
        return falta;
      case 2:
        return agendada;
      case 3:
        return andamento;
      case 4:
        return confirmada;
      default:
        return padrao;
    }
  }

  Widget _getStatusWidget(int statusCode) {
    switch (statusCode) {
      case 0:
        return _cardBtn(realizada, 'CHECK-IN', () {});
      case 1:
        return const SizedBox();
      case 2:
        return GestureDetector(
          onTap: () {},
          child: Icon(
            size: 4.h,
            Icons.edit_outlined,
            color: black,
          ),
        );
      case 3:
        return const SizedBox();
      case 4:
        return _cardBtn(confirmada, 'CHECK-OUT', () {});
      default:
        return _cardBtn(realizada, 'CHECK-IN', () {});
    }
  }

  Widget _cardBtn(Color color, String label, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 2.5.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
          child: textWidget(label, color: white),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _store.reset();

    scrollController.dispose();

    super.dispose();
  }
}

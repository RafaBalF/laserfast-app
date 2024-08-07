import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:laserfast_app/app/models/session.model.dart';
import 'package:laserfast_app/app/modules/sessao/sessao_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/modal_bottom_sheet.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divided_card_widget.dart';
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
  final SessaoStore _store = Modular.get<SessaoStore>();
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
    _future = Future.wait([_store.initHistory()]);

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
              _getStatusWidget(session),
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

  Widget _getStatusWidget(SessionModel session) {
    switch (session.statusCode) {
      case 0:
        return _cardBtn(
          realizada,
          'CHECK-IN',
          () {
            _store.setSessaoParaCheckIn(session);
            Modular.to.pushNamed('/sessao/check_in');
          },
        );
      case 1:
        return const SizedBox();
      case 2:
        return GestureDetector(
          onTap: () => _edit(session),
          child: Icon(
            size: 4.h,
            Icons.edit_outlined,
            color: black,
          ),
        );
      case 3:
        return const SizedBox();
      case 4:
        return _cardBtn(confirmada, 'AVALIAR', () => _avaliar(session));
      default:
        return const SizedBox();
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

  void _edit(SessionModel session) {
    showCustomBottomSheet(
      context,
      'AGENDA',
      Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
            child: DividedCardWidget(
              header: 'Resumo:',
              content: Column(
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
                  DividerWidget(height: 0.5.h),
                ],
              ),
            ),
          ),
          DividerWidget(height: 5.h),
          ButtonWidget.filled(
            onPressed: () async {
              await _store.confirmSession(session);
              Modular.to.pop();
            },
            backgroundColor: accent,
            title: 'CONFIRMAR',
            textColor: white,
          ),
          DividerWidget(height: 2.h),
          ButtonWidget.outlined(
            onPressed: () => Modular.to.pushNamed(
              '/sessao/agendamento',
              arguments: session.id,
            ),
            borderColor: grey,
            title: 'REAGENDAR',
            textColor: darkerGrey,
          ),
          DividerWidget(height: 2.h),
        ],
      ),
    );
  }

  void _avaliar(SessionModel session) {
    showCustomBottomSheet(
      context,
      'AGENDA',
      Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
            child: DividedCardWidget(
              header: 'Resumo:',
              content: Column(
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
                  DividerWidget(height: 0.5.h),
                ],
              ),
            ),
          ),
          DividerWidget(height: 5.h),
          ButtonWidget.filled(
            onPressed: () {
              _store.setSessaoSendoAvaliada(session);
              Modular.to.pop();
              Modular.to.pushNamed('/sessao/avaliar');
            },
            backgroundColor: accent,
            title: 'AVALIAR',
            textColor: white,
          ),
          DividerWidget(height: 2.h),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _store.resetHistory();

    scrollController.dispose();

    super.dispose();
  }
}

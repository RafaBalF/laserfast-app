import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laserfast_app/app/models/credit_card.model.dart';
import 'package:laserfast_app/app/modules/pagamento/pagamentos_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyCardsPage extends StatefulWidget {
  const MyCardsPage({super.key});
  @override
  MyCardsPageState createState() => MyCardsPageState();
}

class MyCardsPageState extends State<MyCardsPage> {
  final PagamentosStore _store = Modular.get<PagamentosStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.initMyCards()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
          title: 'MEUS CARTÕES',
          useDefaultPadding: false,
          bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
          body: Observer(
            builder: (_) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Observer(builder: (_) {
                  return (_store.myCards.isEmpty)
                      ? _emptyBody()
                      : _filledBody();
                });
              } else {
                return _loadingBody();
              }
            },
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

  Widget _emptyBody() {
    return Column(
      children: [
        DividerWidget(height: 10.h),
        SvgPicture.asset(
          'assets/images/pagamentos/cards.svg',
          height: 12.h,
        ),
        DividerWidget(height: 1.h),
        textWidget(
          'Sem cartões cadastrados',
          style: h2(color: grey),
        ),
        DividerWidget(height: 10.h),
        _newCardBtn(accent, white),
      ],
    );
  }

  Widget _filledBody() {
    return Observer(builder: (_) {
      return Column(
        children: _store.myCards.map((c) => _card(c)).toList(),
      );
    });
  }

  Widget _card(CreditCardModel card) {
    String number = card.numero!;

    String start = "${number[0]}${number[1]}${number[2]}${number[3]}";
    String end = "${number[18]}${number[17]}${number[16]}${number[15]}";

    String displayNumber = "$start **** **** $end";

    Color borderColor = grey;
    Color iconColor = darkerGrey;

    if (_store.selectedCard == card) {
      borderColor = iconColor = accent;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
        ),
        child: RadioListTile(
          value: card,
          groupValue: _store.selectedCard,
          onChanged: _store.selectCard,
          title: textWidget(displayNumber),
          secondary: Icon(Icons.credit_card, size: 24.sp, color: iconColor),
          subtitle: Flex(
            direction: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  print('ansdfaidasdasdasd');
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: textWidget(
                    'Excluir',
                    style: text(
                      color: accent,
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _newCardBtn(Color bgColor, Color textColor) {
    return ButtonWidget.filled(
      onPressed: () {
        Modular.to.pushNamed('/pagamentos/credit-card-form');
      },
      backgroundColor: bgColor,
      title: 'CADASTRAR NOVO CARTÃO',
      textColor: textColor,
    );
  }

  @override
  void dispose() {
    _store.resetMyCards();

    super.dispose();
  }
}

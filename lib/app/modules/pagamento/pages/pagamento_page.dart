import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:laserfast_app/app/modules/pagamento/pagamentos_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PagamentoPage extends StatefulWidget {
  const PagamentoPage({super.key});
  @override
  PagamentoPageState createState() => PagamentoPageState();
}

class PagamentoPageState extends State<PagamentoPage> {
  final PagamentosStore _store = Modular.get<PagamentosStore>();
  late final Future<void> _future;

  final DateFormat dateFormatter = DateFormat("dd/MM/yyyy");
  final NumberFormat currencyFormatter = NumberFormat("#,##0.00", "pt_BR");

  @override
  void initState() {
    _future = Future.wait([_store.initPagamento()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
          title: 'PAGAMENTO',
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
    return Column(
      children: [
        SizedBox(width: 100.w, child: textWidget('Pagamento', style: h2())),
        DividerWidget(height: 2.h),
        _summary(),
        DividerWidget(height: 2.h),
        _payment(),
      ],
    );
  }

  Widget _summary() {
    double finalPrice = 0;
    List<Widget> discounts = [];

    for (var payment in _store.selectedPayments) {
      finalPrice += payment.price ?? 0;

      if (payment.discount == null) continue;

      String discount = currencyFormatter.format(payment.discount);
      String price = currencyFormatter.format(payment.price);

      discounts.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60.w,
            child: textWidget("Desconto de R\$ $discount gerado pelo app"),
          ),
          Flexible(child: textWidget("R\$ $price", style: label())),
        ],
      ));
    }

    return _card(
      'Resumo:',
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: discounts,
            ),
          ),
          DividerWidget(height: 2.h),
          SizedBox(
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget("Total", style: headTitle(color: accent)),
                textWidget(
                  "R\$ ${currencyFormatter.format(finalPrice)}",
                  style: headTitle(color: accent),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _payment() {
    return _card(
      'Pagamento:',
      SizedBox(
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget("Escolha a forma de pagamento:"),
            DividerWidget(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _paymentMethodCard(Icons.pix, 'PIX', '/pagamentos/pix'),
                _paymentMethodCard(Icons.credit_card, 'CARTÃO DE CRÉDITO',
                    '/pagamentos/my-cards'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(String header, Widget content) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: darkGrey,
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Container(
            height: 5.h,
            width: 100.w,
            decoration: const BoxDecoration(
              color: backgroundSecondary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
              child: textWidget(
                header,
                style: headTitle(),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Container(
            width: 100.w,
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: content,
          ),
        ],
      ),
    );
  }

  Widget _paymentMethodCard(IconData icon, String text, String route) {
    return GestureDetector(
      child: Container(
        width: 35.w,
        height: 12.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: grey),
        ),
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 6.h,
              width: 35.w,
              child: Icon(
                icon,
                color: grey,
                size: 26.sp,
              ),
            ),
            DividerWidget(height: 1.h),
            Flexible(
              child: textWidget(
                text,
                textAlign: TextAlign.center,
                style: label(color: black),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Modular.to.pushNamed(route);
      },
    );
  }

  @override
  void dispose() {
    _store.resetPagamento();

    super.dispose();
  }
}

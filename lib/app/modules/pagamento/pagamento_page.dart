import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:laserfast_app/app/models/payment.model.dart';
import 'package:laserfast_app/app/modules/pagamento/pagamento_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/interfaces/simple_selectable_card.interface.dart';
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
  final PagamentoStore _store = Modular.get<PagamentoStore>();
  late final Future<void> _future;
  final ScrollController scrollController = ScrollController();

  final double _height = 100.h;
  final double _width = 100.w;

  final DateFormat dateFormatter = DateFormat("dd/MM/yyyy");

  final pago = const Color(0XFFB8F8E5);
  final pagoCard = const Color(0XFF72DCBC);
  final atrasado = const Color(0xFFFBDDDD);
  final atrasadoCard = const Color(0xFFFF7E7E);
  final antecipar = const Color(0XFFF0F0F0);
  final anteciparCard = const Color(0XFFC7C7C7);
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
            title: 'PAGAMENTOS',
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
    return Column(
      children: [
        _filter(),
        Observer(builder: (_) {
          return SizedBox(
            height: _height,
            width: _width,
            child: ListView.builder(
              itemCount: _store.displayedPayments.length,
              itemBuilder: (context, index) =>
                  _paymentCard(_store.displayedPayments[index]),
            ),
          );
        }),
      ],
    );
  }

  Widget _filter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textWidget('Exibir somente em aberto', style: label()),
        Observer(builder: (_) {
          return Switch(
            value: _store.onlyOpened,
            onChanged: _store.setOnlyOpened,
          );
        }),
      ],
    );
  }

  Widget _paymentCard(SimpleSelectableCard<PaymentModel> payment) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Container(
        decoration: BoxDecoration(
          color: _getMainColor(payment.value.statusCode),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        padding: EdgeInsets.all(1.w),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                  child: Center(
                    child: Checkbox(
                      value: payment.selected,
                      onChanged: (b) => _store.selectPayment(payment.value),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String _getStatus(int? statusCode) {
    switch (statusCode) {
      case 0:
        return 'PAGO';
      case 1:
        return 'ATRASADO';
      case 2:
        return 'ANTECIPAR';
      default:
        return '';
    }
  }

  Color _getMainColor(int? statusCode) {
    switch (statusCode) {
      case 0:
        return pago;
      case 1:
        return atrasado;
      case 2:
        return antecipar;
      default:
        return padrao;
    }
  }

  Color _getCardColor(int? statusCode) {
    switch (statusCode) {
      case 0:
        return pagoCard;
      case 1:
        return atrasadoCard;
      case 2:
        return anteciparCard;
      default:
        return padrao;
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

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:laserfast_app/app/models/contrato.model.dart';
import 'package:laserfast_app/app/models/item_contrato.model.dart';
import 'package:laserfast_app/app/modules/profile/profile_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/enums/button_sizes.enum.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContratosPage extends StatefulWidget {
  const ContratosPage({super.key});
  @override
  ContratosPageState createState() => ContratosPageState();
}

class ContratosPageState extends State<ContratosPage> {
  final ProfileStore _store = Modular.get<ProfileStore>();
  late final Future<void> _future;

  final DateFormat emissaoFormatter = DateFormat("dd/MM/yyyy");

  @override
  void initState() {
    _future = Future.wait([_store.initContratos()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'CONTRATOS',
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Column(
                    children:
                        _store.contratos.map((i) => _contratoCard(i)).toList(),
                  );
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

  Widget _contratoCard(ContratoModel contrato) {
    final codigo = "Contrato #${contrato.codigoComanda}";
    final data = (contrato.dataEmissao != null)
        ? emissaoFormatter.format(contrato.dataEmissao!)
        : "";

    return Container(
      height: 15.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: grey),
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget(codigo, style: label(color: primary)),
              textWidget(data, style: label()),
            ],
          ),
          _detalhesContrato(contrato.itens!),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget.filled(
                width: 40.w,
                onPressed: () {},
                title: "CONTRATO",
                buttonSize: ButtonSize.small,
                fontSize: 15,
              ),
              ButtonWidget.filled(
                width: 40.w,
                onPressed: () {},
                title: "TERMOS",
                buttonSize: ButtonSize.small,
                fontSize: 15,
                backgroundColor: primaryDark,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _detalhesContrato(List<ItemContratoModel> itens) {
    if (itens.isEmpty) return const SizedBox();

    final categoriaItem = itens.first.categoriaItem;
    final tipoItem = itens.first.tipoItem;
    final item = itens.first.item;

    if (itens.length == 1) {
      return Column(
        children: [
          textWidget(categoriaItem),
          textWidget("$tipoItem - $item", style: small()),
        ],
      );
    }

    final qtdExtra = itens.length - 1;

    return Column(
      children: [
        textWidget(categoriaItem),
        textWidget("$tipoItem - $item", style: small()),
        textWidget("e mais $qtdExtra items", style: small()),
      ],
    );
  }

  @override
  void dispose() {
    _store.resetContratos();

    super.dispose();
  }
}

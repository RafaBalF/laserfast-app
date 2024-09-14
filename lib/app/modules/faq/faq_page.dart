import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/models/perguntas_respostas.model.dart';
import 'package:laserfast_app/app/modules/faq/faq_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/widgets/accordion_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});
  @override
  FAQPageState createState() => FAQPageState();
}

class FAQPageState extends State<FAQPage> {
  final FAQStore _store = Modular.get<FAQStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.getPerguntasRespostas()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'FAQ',
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Observer(builder: (_) {
                    return _body();
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

  Widget _body() {
    return Column(
      children: [
        textWidget('Tire suas dúvidas sobre os procedimentos'),
        DividerWidget(height: 2.h),
        Column(
          children: _store.perguntasRespostas.map((p) => _tile(p)).toList(),
        )
      ],
    );
  }

  Widget _tile(PerguntasRespostasModel p) {
    return AccordionWidget(
      label: p.pergunta ?? "",
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Text(p.resposta ?? ""),
      ),
      titleStyle: h2(color: primary),
      initiallyExpanded: true,
    );
  }

  @override
  void dispose() {
    _store.reset();

    super.dispose();
  }
}

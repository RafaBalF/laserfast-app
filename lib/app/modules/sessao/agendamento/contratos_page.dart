// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:laserfast_app/app/models/contrato.model.dart';
// import 'package:laserfast_app/app/modules/sessao/sessao_store.dart';
// import 'package:laserfast_app/app/shared/colors.dart';
// import 'package:laserfast_app/app/shared/text_styles.dart';
// import 'package:laserfast_app/app/shared/text_widget.dart';
// import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
// import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
// import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
// import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class ContratosPage extends StatefulWidget {
//   const ContratosPage({super.key});
//   @override
//   ContratosPageState createState() => ContratosPageState();
// }

// class ContratosPageState extends State<ContratosPage> {
//   final SessaoStore _store = Modular.get<SessaoStore>();
//   late final Future<void> _future;

//   @override
//   void initState() {
//     _future = Future.wait([
//       _store.getContratos(),
//     ]);

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _future,
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         return SimpleScaffoldWidget(
//             title: 'CONTRATOS',
//             bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
//             body: Observer(
//               builder: (_) {
//                 if (snapshot.connectionState == ConnectionState.done &&
//                     snapshot.hasData) {
//                   return Observer(builder: (_) {
//                     return (_store.contratos.isNotEmpty)
//                         ? _body()
//                         : _bodySemContratos();
//                   });
//                 } else {
//                   return _loadingBody();
//                 }
//               },
//             ));
//       },
//     );
//   }

//   Widget _loadingBody() {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: List.generate(
//           6,
//           (index) => Column(
//             children: [
//               ShimmerWidget(width: 90.w, height: 6.h),
//               DividerWidget(height: 1.h),
//               ShimmerWidget(width: 90.w, height: 2.h),
//               DividerWidget(height: 1.h),
//               ShimmerWidget(width: 90.w, height: 2.h),
//               DividerWidget(height: 3.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _bodySemContratos() {
//     return Column(
//       children: [
//         DividerWidget(height: 5.h),
//         Image.asset('assets/icons/ic_launcher.png', height: 15.h, width: 30.w),
//         DividerWidget(height: 5.h),
//         textWidget(
//           'Parece que você não tem contratos ativos',
//           style: large(),
//           textAlign: TextAlign.center,
//         ),
//         DividerWidget(height: 5.h),
//         ButtonWidget.filled(
//           onPressed: () => Modular.to.pop(),
//           backgroundColor: accent,
//           title: 'VOLTAR',
//           textColor: white,
//         ),
//       ],
//     );
//   }

//   Widget _body() {
//     return Column(
//       children: _store.contratos.map((c) => _contratoTile(c)).toList(),
//     );
//   }

//   Widget _contratoTile(ContratoModel c) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 1.h),
//       child: GestureDetector(
//         onTap: () {
//           _store.setContratoSelecionado(c);
//           Modular.to.pop();
//         },
//         child: Container(
//           height: 5.h,
//           width: 100.w,
//           padding: EdgeInsets.only(top: 1.h),
//           decoration: const BoxDecoration(
//             border: BorderDirectional(
//               bottom: BorderSide(color: darkGrey),
//             ),
//           ),
//           child: textWidget('Contrato #${c.codigoComanda}'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/models/session.model.dart';
import 'package:laserfast_app/app/modules/historico/historico_store.dart';
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
            useDefaultPadding: false,
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
      padding: const EdgeInsets.all(24.0),
      child: Text('${session.status}'),
    );
  }

  @override
  void dispose() {
    _store.reset();

    scrollController.dispose();

    super.dispose();
  }
}

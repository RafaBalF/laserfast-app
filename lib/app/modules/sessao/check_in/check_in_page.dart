import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/sessao/sessao_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});
  @override
  CheckInPageState createState() => CheckInPageState();
}

class CheckInPageState extends State<CheckInPage> {
  final SessaoStore _store = Modular.get<SessaoStore>();
  late final Future<void> _future;

  CameraController? _controller;

  @override
  void initState() {
    _future = Future.wait([_store.initCheckIn()]);

    super.initState();
  }

  Future<void> _pedirPermissao() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
    }
  }

  Future<void> _ativarCamera() async {
    final cameras = await availableCameras();

    _controller = CameraController(cameras.first, ResolutionPreset.max);

    _controller!.initialize();

    _store.setShowCameraPreview(true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'CHECK-IN',
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Observer(builder: (_) {
                    return (_store.sessaoParaCheckIn != null)
                        ? _body()
                        : _bodySemSessao();
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

  Widget _bodySemSessao() {
    return Column(
      children: [
        DividerWidget(height: 5.h),
        Image.asset('assets/icons/ic_launcher.png', height: 15.h, width: 30.w),
        DividerWidget(height: 5.h),
        textWidget(
          'Ocorreu um erro, tente novamente mais tarde.',
          style: large(),
          textAlign: TextAlign.center,
        ),
        DividerWidget(height: 5.h),
        ButtonWidget.filled(
          onPressed: () => Modular.to.pop(),
          backgroundColor: accent,
          title: 'VOLTAR',
          textColor: white,
        ),
      ],
    );
  }

  Widget _body() {
    return Column(
      children: [
        DividerWidget(height: 2.5.h),
        _frame(),
        DividerWidget(height: 2.5.h),
        ButtonWidget.filled(
          onPressed: () async {
            await _pedirPermissao();
            await _ativarCamera();
            setState(() {});
          },
          backgroundColor: accent,
          title: 'TIRAR FOTO',
          textColor: white,
        ),
        DividerWidget(height: 2.5.h),
      ],
    );
  }

  Widget _frame() {
    return Container(
      height: 40.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: grey, width: 1.w),
      ),
      child: Observer(builder: (_) {
        return SizedBox(
            child: (_store.showCameraPreview)
                ? CameraPreview(_controller!)
                : null);
      }),
    );
  }

  @override
  void dispose() {
    _store.resetCheckIn();

    if (_controller != null) {
      _controller!.dispose();
    }

    super.dispose();
  }
}

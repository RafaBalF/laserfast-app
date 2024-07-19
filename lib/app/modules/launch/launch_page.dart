import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/launch/launch_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/enums/button_sizes.enum.dart';
import 'package:laserfast_app/app/shared/text.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/create_account_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LaunchPage extends StatefulWidget {
  final String title;
  const LaunchPage({super.key, this.title = 'LaunchPage'});
  @override
  LaunchPageState createState() => LaunchPageState();
}

class LaunchPageState extends State<LaunchPage> with TickerProviderStateMixin {
  final LaunchStore _store = Modular.get<LaunchStore>();
  late final AnimationController _animationController =
      AnimationController(vsync: this);

  @override
  void initState() {
    _store.checkShowPresentation();
    super.initState();
  }

  @override
  void dispose() {
    try {
      _animationController.dispose();
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_store.isLogged()) {
      _animationController.dispose();

      Modular.to.navigate('/home/initial');

      return Container(color: primary);
    }

    if (!_store.usingAppForFirstTime) {
      _store.incrementPresentationIndex(index: 2);
    }

    return mainBody();
  }

  Widget mainBody() {
    List<Widget> presentationPages = _presentation();
    return Scaffold(
        body: SizedBox(
      height: 100.h,
      width: 100.w,
      child: Observer(builder: (_) {
        return presentationPages[_store.presentationIndex];
      }),
    ));
  }

  List<Widget> _presentation() {
    return [
      _firstPage(),
      _secondPage(),
    ];
  }

  Widget _firstPage() {
    return _presentationTemplate(
        'assets/images/app_presentation/first.png',
        'Descontos Exclusivos',
        'Inúmeros cupons e promoções para você se dar bem',
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: ButtonWidget.filledIcon(
            onPressed: () {
              _changePage();
            },
            backgroundColor: accent,
            iconData: Icons.arrow_forward_ios,
            iconSize: 20.sp,
            iconColor: white,
            buttonSize: ButtonSize.large,
          ),
        ));
  }

  Widget _secondPage() {
    return _presentationTemplate(
        'assets/images/app_presentation/third.png',
        'Login',
        'Ache as melhores ofertas e\nnegócios perto de você',
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DividerWidget(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  ButtonWidget.filled(
                    title: 'Entrar sem login',
                    onPressed: () {
                      Modular.to.navigate('/home/initial');
                    },
                    backgroundColor: accent,
                    textColor: primaryDark,
                  ),
                  DividerWidget(height: 3.h),
                  ButtonWidget.filled(
                    title: 'Fazer login',
                    onPressed: () {
                      Modular.to.pushNamed('/auth/login');
                    },
                    backgroundColor: primaryDark,
                    textColor: white,
                  ),
                ],
              ),
            ),
            DividerWidget(height: 3.h),
            const CreateAccountWidget(
              textColor: white,
            ),
          ],
        ));
  }

  void _changePage() {
    _store.incrementPresentationIndex();
    try {
      _animationController.reset();
      _animationController.forward();
    } catch (_) {}
  }

  Widget _presentationTemplate(
    String imgPath,
    String header,
    String subHeader,
    Widget widget,
  ) {
    return Container(
      decoration: const BoxDecoration(color: primary),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imgPath,
              height: 50.h,
            ),
            textWidget(
              header,
              textAlign: TextAlign.center,
              style: onboardingTitle(color: white),
              maxLines: 3,
            ),
            DividerWidget(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: textWidget(
                subHeader,
                textAlign: TextAlign.center,
                style: headTitle(color: white),
              ),
            ),
            widget,
            DividerWidget(height: 5.h),
          ]),
    );
  }
}

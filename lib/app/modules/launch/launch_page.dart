import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:compregados_app_v2/app/modules/launch/launch_store.dart';
import 'package:compregados_app_v2/app/shared/colors.dart';
import 'package:compregados_app_v2/app/shared/text.dart';
import 'package:compregados_app_v2/app/shared/text_styles.dart';
import 'package:compregados_app_v2/app/shared/widgets/button_widget.dart';
import 'package:compregados_app_v2/app/shared/widgets/create_account_widget.dart';
import 'package:compregados_app_v2/app/shared/widgets/divider_widget.dart';
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
      _thirdPage(),
    ];
  }

  Widget _firstPage() {
    return _presentationTemplate(
        'assets/images/app_presentation/first.png',
        'Negocie os melhores gados do mercado',
        'Negocie gados de forma segura e fácil',
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: ButtonWidget.filledIcon(
            onPressed: () {
              _changePage();
            },
            backgroundColor: accent,
            iconData: Icons.arrow_forward_ios,
            iconSize: 24.sp,
            iconColor: primaryDark,
          ),
        ));
  }

  Widget _secondPage() {
    return _presentationTemplate(
        'assets/images/app_presentation/second.png',
        'Ache os melhores\nmaquinários da\nsua região',
        'Ache as melhores ofertas e\nnegócios perto de você',
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: ButtonWidget.filledIcon(
            onPressed: () {
              _changePage();
              _store.setHasSeenAppPresentationBefore();
            },
            backgroundColor: accent,
            iconData: Icons.arrow_forward_ios,
            iconSize: 24.sp,
            iconColor: primaryDark,
          ),
        ));
  }

  Widget _thirdPage() {
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
      decoration: BoxDecoration(
        color: primary,
        image: DecorationImage(
          image: AssetImage(imgPath),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              primary,
            ],
            stops: [0.10, 0.45],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textWidget(header,
                  textAlign: TextAlign.center,
                  style: onboardingTitle(color: white),
                  maxLines: 3),
              DividerWidget(height: 2.h),
              textWidget(
                subHeader,
                textAlign: TextAlign.center,
                style: text(color: white),
              ),
              widget,
              DividerWidget(height: 20.h),
            ]),
      ),
    );
  }
}

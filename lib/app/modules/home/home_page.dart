import 'package:flutter/widgets.dart';
import 'package:laserfast_app/app/modules/home/widgets/main_scaffold/main_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/home/home_store.dart';
import 'package:laserfast_app/app/modules/home/widgets/redirect_card_widget.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, this.title = 'HomePage'});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore _store = Modular.get<HomeStore>();

  @override
  void initState() {
    _store.initHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double spacing = 3.h;

    return MainScaffoldWidget(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DividerWidget(height: spacing),
        _cards(),
        DividerWidget(height: spacing),
        _mostAccessed(),
      ],
    ));
  }

  Widget _cards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/calendar_accent.svg',
            label: 'Agenda',
            route: '', // TODO: COLOCAR ROTA CERTA
            labelColor: accent,
            margin: EdgeInsets.only(right: 2.w),
          ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/document_accent.svg',
            label: 'Sessões realizadas',
            route: '', // TODO: COLOCAR ROTA CERTA
            labelColor: accent,
            margin: EdgeInsets.only(right: 2.w),
          ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/money_accent.svg',
            label: 'Pagamentos',
            route: '', // TODO: COLOCAR ROTA CERTA
            labelColor: accent,
            margin: EdgeInsets.only(right: 2.w),
          ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/blockquote_accent.svg',
            label: 'Diário',
            route: '', // TODO: COLOCAR ROTA CERTA
            labelColor: accent,
            margin: EdgeInsets.only(right: 2.w),
          ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/list-details_accent.svg',
            label: 'Perguntas frequentes',
            route: '', // TODO: COLOCAR ROTA CERTA
            labelColor: accent,
            margin: EdgeInsets.only(right: 2.w),
          ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/chat_accent.svg',
            label: 'Chat',
            route: '', // TODO: COLOCAR ROTA CERTA
            labelColor: accent,
            margin: EdgeInsets.only(right: 2.w),
          ),
        ],
      ),
    );
  }

  Widget _mostAccessed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          'Mais acessados',
          style: h2(color: accent),
          textAlign: TextAlign.start,
        ),
        DividerWidget(height: 2.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TODO: COLOCAR ROTA CERTA
              _mostAccessedCard('MEU DIÁRIO', ''),
              _mostAccessedCard('MEU TRATAMENTO', ''),
              _mostAccessedCard('FINANCEIRO', ''),
            ],
          ),
        )
      ],
    );
  }

  Widget _mostAccessedCard(String label, String route) {
    return Container(
      width: 35.w,
      height: 4.h,
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: grey),
          ),
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          alignment: Alignment.center,
          child: textWidget(
            label,
            textAlign: TextAlign.center,
            style: profileTile(color: darkGrey),
            maxLines: 2,
          ),
        ),
        onTap: () {
          Modular.to.pushNamed(route);
        },
      ),
    );
  }
}

import 'package:intl/intl.dart';
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
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, this.title = 'HomePage'});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore _store = Modular.get<HomeStore>();
  final NumberFormat currencyFormatter = NumberFormat("#,##0.00", "pt_BR");

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
        DividerWidget(height: spacing),
        _horizontalBanners(),
        DividerWidget(height: spacing),
        _verticalBanners(),
        DividerWidget(height: spacing),
        _mostWished(),
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
          ),
        ),
        onTap: () {
          Modular.to.pushNamed(route);
        },
      ),
    );
  }

  Widget _horizontalBanners() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _horizontalBanner('assets/images/banners/partners.png', ''),
        DividerWidget(height: 1.h),
        _horizontalBanner('assets/images/banners/your-sessions.png', ''),
      ],
    );
  }

  Widget _horizontalBanner(String imgPath, String route) {
    return SizedBox(
      width: 90.w,
      child: GestureDetector(
        onTap: () {
          Modular.to.pushNamed(route);
        },
        child: Image.asset(
          imgPath,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _verticalBanners() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _verticalBanner('assets/images/banners/duckbill.png', ''),
          SizedBox(width: 2.w),
          _verticalBanner(
            'assets/images/banners/fastmassagem.png',
            'https://www.instagram.com/fastmassagem_/',
          ),
          // TODO: ADICIONAR O OUTRO BANNER DPS Q O POLO ME PASSAR
        ],
      ),
    );
  }

  Widget _verticalBanner(String imgPath, String route) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          launchUrlString(route);
        },
        child: Image.asset(imgPath),
      ),
    );
  }

  Widget _mostWished() {
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
              _mostWishedCard(
                'Pernas inteiras 12 vezes',
                'assets/images/home/most-wished-1.png',
                '',
                2229.90,
                oldPrice: 1349.85,
                duration: '25 min',
                review: 4.5,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _mostWishedCard(
    String title,
    String photo,
    String route,
    double price, {
    double? oldPrice,
    String? duration,
    double? review,
  }) {
    double radius = 10;
    String formattedPrice = "R\$ ${currencyFormatter.format(price)}";

    Widget reviewBadge = (review != null)
        ? Positioned(
            height: 5.h,
            child: Container(
                margin: const EdgeInsets.all(7.5),
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    textWidget(review.toString(), style: small()),
                    SizedBox(width: 1.w),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                      size: 15,
                    )
                  ],
                )),
          )
        : const SizedBox();

    Widget oldPriceWidget = (oldPrice != null) ? Container() : const SizedBox();

    Widget durationWidget = (duration != null)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.schedule, color: darkGrey, size: 15),
              SizedBox(width: 1.w),
              textWidget(duration, style: small()),
            ],
          )
        : const SizedBox();

    return GestureDetector(
      onTap: () {
        launchUrlString(route);
      },
      child: Container(
        width: 40.w,
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: grey,
              blurRadius: 5,
            ),
          ],
          color: background,
          borderRadius: BorderRadius.circular(radius),
        ),
        margin: EdgeInsets.only(right: 5.w),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: 40.w,
                  height: 15.h,
                  decoration: const BoxDecoration(
                    color: background,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                    ),
                    child: Image.asset(
                      photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 40.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 0.5.h,
                  ),
                  child: Column(
                    children: [
                      textWidget(
                        title,
                        textAlign: TextAlign.start,
                        style: mostWished(color: darkerGrey),
                      ),
                      DividerWidget(height: 1.h),
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          Column(
                            children: [
                              oldPriceWidget,
                              textWidget(formattedPrice,
                                  style: headTitle(color: success)),
                            ],
                          ),
                          durationWidget
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            reviewBadge,
          ],
        ),
      ),
    );
  }
}

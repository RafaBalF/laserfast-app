import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:laserfast_app/app/models/banner_vertical.model.dart';
import 'package:laserfast_app/app/models/mais_desejado.model.dart';
import 'package:laserfast_app/app/modules/home/widgets/cashback_widget.dart';
import 'package:laserfast_app/app/modules/home/widgets/main_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/home/home_store.dart';
import 'package:laserfast_app/app/modules/home/widgets/redirect_card_widget.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore _store = Modular.get<HomeStore>();
  late final Future<void> _future;

  final NumberFormat currencyFormatter = NumberFormat("#,##0.00", "pt_BR");

  final double mostWishedCardWidth = 50.w;
  final double mostWishedCardRadius = 10;
  final double mostWishedPhotoHeight = 20.h;
  final double mostWishedDetailsHeight = 12.h;

  @override
  void initState() {
    _future = Future.wait([
      _store.getCashback(),
      _store.getBannersVerticais(),
      _store.getMaisDesejados(),
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return MainScaffoldWidget(body: Observer(
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
        children: [
          DividerWidget(height: 3.h),
          SizedBox(
            height: 10.h,
            width: 100.w,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(right: 3.w),
                  child: ShimmerWidget(width: 20.w, height: 25.h),
                );
              },
            ),
          ),
          DividerWidget(height: 3.h),
          SizedBox(
            height: 5.h,
            width: 90.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShimmerWidget(width: 70.w, height: 4.h),
                ShimmerWidget(width: 15.w, height: 4.h),
              ],
            ),
          ),
          DividerWidget(height: 3.h),
          ShimmerWidget(width: 90.w, height: 12.h),
          DividerWidget(height: 2.h),
          ShimmerWidget(width: 90.w, height: 12.h),
          DividerWidget(height: 3.h),
          SizedBox(
            height: 25.h,
            width: 100.w,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: ShimmerWidget(width: 43.w, height: 10.h),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    final double spacing = 3.h;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DividerWidget(height: spacing),
        _cards(),
        Observer(builder: (_) => CashbackWidget(valor: _store.cashback)),
        DividerWidget(height: spacing),
        _mostAccessed(),
        DividerWidget(height: spacing),
        _horizontalBanners(),
        DividerWidget(height: spacing),
        _verticalBanners(),
        DividerWidget(height: spacing),
        _mostWished(),
      ],
    );
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
            route: '/sessao/agendamento',
            labelColor: primary,
            margin: EdgeInsets.only(right: 2.w),
          ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/document_accent.svg',
            label: 'Sessões realizadas',
            route: '/sessao/historico',
            labelColor: primary,
            margin: EdgeInsets.only(right: 2.w),
          ),
          // RedirectCardWidget(
          //   imgPath: 'assets/icons/svg/money_accent.svg',
          //   label: 'Pagamentos',
          //   route: '/pagamentos/',
          //   labelColor: primary,
          //   margin: EdgeInsets.only(right: 2.w),
          //   maxlines: 1,
          // ),
          // RedirectCardWidget(
          //   imgPath: 'assets/icons/svg/blockquote_accent.svg',
          //   label: 'Diário',
          //   route: '/diario/',
          //   labelColor: primary,
          //   margin: EdgeInsets.only(right: 2.w),
          // ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/list-details_accent.svg',
            label: 'Perguntas frequentes',
            route: '/faq',
            labelColor: primary,
            margin: EdgeInsets.only(right: 2.w),
          ),
          // RedirectCardWidget(
          //   imgPath: 'assets/icons/svg/chat_accent.svg',
          //   label: 'Chat',
          //   route: '',
          //   labelColor: primary,
          //   margin: EdgeInsets.only(right: 2.w),
          // ),
          // TODO: REMOVER CARDS INÚTEIS
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/calendar_accent.svg',
            label: 'Agenda',
            route: '/sessao/agendamento',
            labelColor: primary,
            margin: EdgeInsets.only(right: 2.w),
          ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/calendar_accent.svg',
            label: 'Agenda',
            route: '/sessao/agendamento',
            labelColor: primary,
            margin: EdgeInsets.only(right: 2.w),
          ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/calendar_accent.svg',
            label: 'Agenda',
            route: '/sessao/agendamento',
            labelColor: primary,
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
          style: h2(color: primary),
          textAlign: TextAlign.start,
        ),
        DividerWidget(height: 2.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // _mostAccessedCard('MEU DIÁRIO', '/diario/'),
              _mostAccessedCard('MEU TRATAMENTO', '/sessao/historico'),
              // _mostAccessedCard('FINANCEIRO', '/pagamentos/'),
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
        _horizontalBanner(
          'assets/images/banners/partners.png',
          () => Modular.to.pushNamed('/parceiros/'),
        ),
        DividerWidget(height: 1.h),
        _horizontalBanner(
          'assets/images/banners/your-sessions.png',
          () => Modular.to.pushNamed("/sessao/historico"),
        ),
      ],
    );
  }

  Widget _horizontalBanner(String imgPath, Function()? onTap) {
    return SizedBox(
      width: 90.w,
      child: GestureDetector(
        onTap: onTap,
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
        children:
            _store.bannersVerticais.map((b) => _verticalBanner(b)).toList(),
      ),
    );
  }

  Widget _verticalBanner(BannerVerticalModel b) {
    return Padding(
      padding: EdgeInsets.only(right: 2.w),
      child: GestureDetector(
        onTap: () {
          launchUrlString(b.link ?? "");
        },
        child: Image.network(b.imagem ?? ""),
      ),
    );
  }

  Widget _mostWished() {
    if (_store.maisDesejados.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget(
              'Mais desejados',
              style: h2(),
              textAlign: TextAlign.start,
            ),
            GestureDetector(
              onTap: () async {
                await launchUrlString("https://lfcare.laserfast.com.br/");
              },
              child: Row(
                children: [
                  textWidget(
                    'Ver todos',
                    style: text(color: primary),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: primary,
                  )
                ],
              ),
            )
          ],
        ),
        DividerWidget(height: 2.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                _store.maisDesejados.map((m) => _mostWishedCard(m)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _mostWishedCard(MaisDesejadoModel m) {
    String formattedPrice = "R\$ ${currencyFormatter.format(m.por)}";

    Widget oldPriceWidget = (m.de != null)
        ? textWidget(
            "R\$ ${currencyFormatter.format(m.de)}",
            style: verySmall(textDecoration: TextDecoration.lineThrough),
            textAlign: TextAlign.start,
          )
        : const SizedBox();

    return GestureDetector(
      onTap: () {
        launchUrlString(m.link ?? "");
      },
      child: Container(
        width: mostWishedCardWidth,
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: grey,
              blurRadius: 5,
            ),
          ],
          color: background,
          borderRadius: BorderRadius.circular(mostWishedCardRadius),
        ),
        margin: EdgeInsets.only(right: 5.w, bottom: 1.h),
        child: Column(
          children: [
            Container(
              width: mostWishedCardWidth,
              height: mostWishedPhotoHeight,
              decoration: const BoxDecoration(
                color: background,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(mostWishedCardRadius),
                  topRight: Radius.circular(mostWishedCardRadius),
                ),
                child: Image.network(m.imagem ?? "", fit: BoxFit.cover),
              ),
            ),
            Container(
              height: mostWishedDetailsHeight,
              width: mostWishedCardWidth,
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 1.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textWidget(
                    m.descricao,
                    textAlign: TextAlign.start,
                    style: mostWished(color: darkerGrey),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 25.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            oldPriceWidget,
                            textWidget(
                              formattedPrice,
                              style: headTitle(
                                color: success,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

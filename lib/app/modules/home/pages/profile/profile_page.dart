import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:compregados_app_v2/app/modules/home/pages/profile/profile_store.dart';
import 'package:compregados_app_v2/app/modules/home/widgets/tab_body_widget.dart';
import 'package:compregados_app_v2/app/shared/colors.dart';
import 'package:compregados_app_v2/app/shared/text.dart';
import 'package:compregados_app_v2/app/shared/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({super.key, this.title = 'ProfilePage'});
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final ProfileStore _store = Modular.get<ProfileStore>();

  @override
  void initState() {
    _store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = _getTiles();

    return TabBodyWidget(
        widget: SizedBox(
      height: 100.h,
      width: 90.w,
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 0.90,
        children: List.generate(tiles.length, (index) {
          return Center(
            child: tiles[index],
          );
        }),
      ),
    ));
  }

  List<Widget> _getTiles() {
    return [
      _tileCard(
        'assets/icons/svg/person.svg',
        'Dados pessoais',
        '/home/profile/',
      ),
      _tileCard(
        'assets/icons/svg/map.svg',
        'Endereços cadastrados',
        '/home/profile/',
      ),
      _tileCard(
        'assets/icons/svg/payment.svg',
        'Dados de pagamento',
        '/home/profile/',
      ),
      // _tileCard(
      //   'assets/icons/svg/chat.svg',
      //   'Conversas',
      //   '/home/profile/',
      // ),
      // _tileCard(
      //   'assets/icons/svg/chef_hat.svg',
      //   'Papa Club',
      //   '/home/profile/',
      // ),
      _tileCard(
        'assets/icons/svg/tickets.svg',
        'Cupons',
        '/home/profile/',
      ),
      // _tileCard(
      //   'assets/icons/svg/favorite.svg',
      //   'Favoritos',
      //   '/home/profile/',
      // ),
      _tileCard(
        'assets/icons/svg/cog.svg',
        'Configurações',
        '/home/profile/',
        maxLines: 1,
      ),
      _tileCard(
        'assets/icons/svg/privacy.svg',
        'Políticas de privacidade',
        '/home/profile/',
      ),
      _tileCard(
        'assets/icons/svg/orders_table.svg',
        'Histórico de pedidos',
        '/home/profile/',
      ),
      _tileCard(
        '',
        'Redefinir senha',
        '/home/profile/',
        isSvg: false,
        icon: Icons.password,
      ),
      // _tileCard(
      //   'assets/icons/svg/franchise.svg',
      //   'Seja um franqueado',
      //   '/home/profile/',
      // ),
    ];
  }

  Widget _tileCard(
    String imgPath,
    String title,
    String route, {
    bool isSvg = true,
    IconData? icon,
    int maxLines = 2,
  }) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: grey,
              )),
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (isSvg)
                  ? SvgPicture.asset(imgPath, height: 40)
                  : Icon(icon, color: primary, size: 40),
              SizedBox(height: 2.h),
              textWidget(
                title,
                textAlign: TextAlign.center,
                style: profileTile(),
                maxLines: maxLines,
              ),
            ],
          ),
        ),
        onTap: () {
          Modular.to.pushNamed(route);
        },
      ),
    );
  }
}

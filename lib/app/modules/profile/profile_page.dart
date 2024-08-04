import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = _getTiles();

    return SimpleScaffoldWidget(
      title: 'PERFIL',
      useDefaultPadding: false,
      bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.90,
          children: tiles.map((t) => t).toList(),
        ),
      ),
    );
  }

  List<Widget> _getTiles() {
    return [
      _tileCard(
        'assets/icons/svg/person_accent.svg',
        'Dados pessoais',
        '/profile/dados-pessoais',
      ),
      _tileCard(
        'assets/icons/svg/map_accent.svg',
        'Endereços cadastrados',
        '/profile/',
      ),
      _tileCard(
        'assets/icons/svg/payment_accent.svg',
        'Dados de pagamento',
        '/profile/',
      ),
      // _tileCard(
      //   'assets/icons/svg/chat_accent.svg',
      //   'Conversas',
      //   '/profile/',
      // ),
      // _tileCard(
      //   'assets/icons/svg/chef_hat_accent.svg',
      //   'Papa Club',
      //   '/profile/',
      // ),
      // _tileCard(
      //   'assets/icons/svg/favorite_accent.svg',
      //   'Favoritos',
      //   '/profile/',
      // ),
      _tileCard(
        'assets/icons/svg/cog_accent.svg',
        'Configurações',
        '/profile/',
        maxLines: 1,
      ),
      _tileCard(
        'assets/icons/svg/privacy_accent.svg',
        'Políticas de privacidade',
        '/profile/',
      ),
      _tileCard(
        'assets/icons/svg/change-password_accent.svg',
        'Redefinir senha',
        '/profile/',
      ),
      // _tileCard(
      //   'assets/icons/svg/franchise_accent.svg',
      //   'Seja um franqueado',
      //   '/profile/',
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

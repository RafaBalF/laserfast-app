import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/modal_bottom_sheet.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/inputs/input_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final GlobalKey<FormState> _indicateFormKey = GlobalKey<FormState>();

  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

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
        () => Modular.to.pushNamed('/profile/dados-pessoais'),
      ),
      _tileCard(
        'assets/icons/svg/map_accent.svg',
        'Endereços cadastrados',
        () => Modular.to.pushNamed('/profile/enderecos'), // TODO: FAZER TELA
      ),
      _tileCard(
        'assets/icons/svg/payment_accent.svg',
        'Dados de pagamento',
        () => Modular.to.pushNamed('/pagamentos/my-cards'),
      ),
      _tileCard(
        'assets/icons/svg/chat_accent.svg',
        'Conversas',
        () => Modular.to.pushNamed('/profile/chat'), // TODO: FAZER TELA
      ),
      _tileCard(
        'assets/icons/svg/parceiros_accent.svg',
        'Parceiros',
        () => Modular.to.pushNamed('/parceiros/'),
      ),
      _tileCard(
        'assets/icons/svg/users_accent.svg',
        'Indicação',
        _indicate, // TODO: TROCAR MOCK POR IMPLEMENTAÇÃO
      ),
      _tileCard(
        'assets/icons/svg/favorite_accent.svg',
        'Diário',
        () => Modular.to.pushNamed('/diario/'), // TODO: FAZER TELA
      ),
      _tileCard(
        'assets/icons/svg/cog_accent.svg',
        'Configurações',
        () => Modular.to.pushNamed('/profile/'), // TODO: FAZER TELA
        maxLines: 1,
      ),
      _tileCard(
        'assets/icons/svg/privacy_accent.svg',
        'Políticas de privacidade',
        () => Modular.to.pushNamed('/profile/'), // TODO: FAZER TELA
      ),
      _tileCard(
        'assets/icons/svg/orders_table_accent.svg',
        'Histórico de sessões',
        () => Modular.to.pushNamed('/historico/'),
      ),
      _tileCard(
        'assets/icons/svg/change-password_accent.svg',
        'Redefinir senha',
        () => Modular.to
            .pushNamed('/profile/redefinir-senha'), // TODO: FAZER TELA
      ),
      _tileCard(
        'assets/icons/svg/franchise_accent.svg',
        'Seja um franqueado',
        () => launchUrlString('https://laserfast.com.br/franquia'),
      ),
    ];
  }

  Widget _tileCard(
    String imgPath,
    String title,
    Function()? onTap, {
    bool isSvg = true,
    IconData? icon,
    int maxLines = 2,
  }) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onTap,
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
      ),
    );
  }

  void _indicate() {
    showCustomBottomSheet(
      context,
      'INDICAR',
      Form(
        key: _indicateFormKey,
        child: Column(
          children: [
            const InputWidget(label: 'Nome'),
            DividerWidget(height: 2.h),
            const InputWidget(label: 'Email'),
            DividerWidget(height: 2.h),
            InputWidget(label: 'Celular', inputFormatters: [phoneFormatter]),
            DividerWidget(height: 5.h),
            ButtonWidget.filled(
              onPressed: () {
                Modular.to.pop();
              },
              backgroundColor: accent,
              title: 'SALVAR',
              textColor: white,
            ),
            DividerWidget(height: 40.h),
          ],
        ),
      ),
    );
  }
}

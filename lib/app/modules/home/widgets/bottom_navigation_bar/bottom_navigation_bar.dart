import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laserfast_app/app/modules/home/widgets/bottom_navigation_bar/bottom_navigation_bar_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final BottomNavigationBarStore _store =
      Modular.get<BottomNavigationBarStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: darkGrey,
            blurRadius: 15,
          ),
        ],
      ),
      child: Observer(builder: (_) {
        return BottomNavigationBar(
          items: [
            _bottomNavigationBarItem(
              'assets/icons/svg/home.svg',
              'Início',
            ),
            _bottomNavigationBarItem(
              'assets/icons/svg/calendar.svg',
              'Agenda',
            ),
            _bottomNavigationBarItem(
              'assets/icons/svg/ticket.svg',
              'Pagamento',
            ),
            _bottomNavigationBarItem(
              'assets/icons/svg/voucher.svg',
              'Vouchers',
            ),
            _bottomNavigationBarItem(
              'assets/icons/svg/chat.svg',
              'Chat',
            ),
          ],
          backgroundColor: background,
          selectedItemColor: darkerGrey,
          selectedIconTheme: const IconThemeData(color: accent),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: darkerGrey,
          unselectedLabelStyle: homeBottomBarItem(),
          selectedLabelStyle: homeBottomBarItem(),
          type: BottomNavigationBarType.fixed,
          currentIndex: _store.selectedIndex,
          onTap: _store.setSelectedIndex,
        );
      }),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String path, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SvgPicture.asset(
          path,
          height: 24.sp,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SvgPicture.asset(
          path,
          height: 24.sp,
          colorFilter: const ColorFilter.mode(accent, BlendMode.srcIn),
        ),
      ),
      label: label,
    );
  }
}

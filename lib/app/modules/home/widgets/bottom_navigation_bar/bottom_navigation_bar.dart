import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laserfast_app/app/modules/home/widgets/bottom_navigation_bar/bottom_navigation_bar_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';

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
    return Observer(builder: (_) {
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
            'assets/icons/svg/payment.svg',
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
        selectedItemColor: darkerGrey,
        selectedIconTheme: const IconThemeData(color: accent),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: darkerGrey,
        currentIndex: _store.selectedIndex,
        onTap: _store.setSelectedIndex,
      );
    });
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String path, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        path,
        height: 32,
      ),
      activeIcon: SvgPicture.asset(
        path,
        height: 32,
        colorFilter: const ColorFilter.mode(accent, BlendMode.srcIn),
      ),
      label: label,
    );
  }
}

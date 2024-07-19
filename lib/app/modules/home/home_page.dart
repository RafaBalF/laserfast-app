import 'package:compregados_app_v2/app/shared/modal_bottom_sheet.dart';
import 'package:compregados_app_v2/app/shared/text.dart';
import 'package:compregados_app_v2/app/shared/text_styles.dart';
import 'package:compregados_app_v2/app/shared/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:compregados_app_v2/app/modules/home/home_store.dart';
import 'package:compregados_app_v2/app/shared/colors.dart';
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
    return Scaffold(
      backgroundColor: primary,
      body: Container(
        height: 100.h,
        width: 100.w,
        alignment: Alignment.topLeft,
        color: white,
        padding: const EdgeInsets.only(top: 0),
        child: const RouterOutlet(),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButton: _floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _bottomNavigationBar() {
    return Observer(builder: (_) {
      return BottomAppBar(
        color: primaryDark,
        height: 10.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _bottomNavigationBarItem(
              Icons.home_outlined,
              'Home',
              _store.selectedIndex == 0,
              onTap: () {
                _store.setSelectedIndex(0);
                Modular.to.navigate('/home/initial');
              },
            ),
            _bottomNavigationBarItem(
              Icons.search_outlined,
              'Pesquisar',
              _store.selectedIndex == 1,
              onTap: () {
                _store.setSelectedIndex(1);
              },
            ),
            _bottomNavigationBarItem(
              null,
              'Anunciar',
              false,
              onTap: () {},
            ),
            _bottomNavigationBarItem(
              Icons.show_chart_outlined,
              'Cotação',
              _store.selectedIndex == 3,
              onTap: () {
                _store.setSelectedIndex(3);
              },
            ),
            _bottomNavigationBarItem(
              Icons.menu,
              'Menu',
              _store.selectedIndex == 4,
              onTap: () {
                _store.setSelectedIndex(4);
                _showMenu(context);
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _bottomNavigationBarItem(IconData? icon, String label, bool selected,
      {Function()? onTap}) {
    return SizedBox(
      width: 16.w,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: selected ? accent : white,
            ),
            textWidget(
              label,
              style: text(color: white),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget _floatingActionButton() {
    return Padding(
      padding: EdgeInsets.only(top: 3.h),
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: accent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        elevation: 0,
        child: const Icon(
          Icons.add,
          color: primary,
          size: 48,
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showCustomBottomSheet(
      context,
      'Menu',
      SizedBox(
        height: 45.h,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          children: [
            _menuItem(
              Icons.show_chart_outlined,
              'Cotação',
              () {},
            ),
            _menuItem(
              Icons.person_outline,
              'Perfil',
              () {},
            ),
            _menuItem(
              Icons.list_outlined,
              'Categorias',
              () {},
            ),
            _menuItem(
              Icons.add,
              'Anunciar',
              () {},
            ),
            _menuItem(
              Icons.chat_outlined,
              'Notícias',
              () {},
            ),
            _menuItem(
              Icons.shopping_bag_outlined,
              'Lojas oficiais',
              () {},
            ),
            _menuItem(
              Icons.list_alt_outlined,
              'Meus anúncios',
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(IconData? icon, String title, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: primary,
          ),
          DividerWidget(height: 1.h),
          textWidget(
            title,
            style: label(color: primary),
            maxLines: 1,
          )
        ],
      ),
    );
  }
}

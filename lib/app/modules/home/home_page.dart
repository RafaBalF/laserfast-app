import 'package:flutter_svg/svg.dart';
import 'package:laserfast_app/app/modules/home/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:laserfast_app/app/shared/text.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/home/home_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
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
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Image.asset('assets/icons/ic_launcher.png'),
        ),
        centerTitle: true,
        backgroundColor: white,
        title: Center(child: _address()),
        elevation: 0,
        toolbarHeight: 10.h,
        actions: [
          _padding(
            GestureDetector(
              child: SvgPicture.asset('assets/icons/svg/user.svg'),
              onTap: () => Modular.to.pushNamed('/home/profile'),
            ),
          )
        ],
        bottom: PreferredSize(
            preferredSize: const Size(0, 0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: white,
                width: 0,
              )),
            )),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        alignment: Alignment.topLeft,
        color: white,
        padding: const EdgeInsets.only(top: 0),
        child: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: const RouterOutlet(),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }

  Widget _address() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textWidget(
            'Aviso',
            style: label(color: darkGrey),
          ),
          textWidget(
            'Você tem pendência',
            style: headTitle(color: accent),
          ),
        ],
      ),
    );
  }

  Widget _padding(Widget child) {
    return Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: child,
    );
  }
}

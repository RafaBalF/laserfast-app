import 'package:laserfast_app/app/modules/home/widgets/main_scaffold/main_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/home/home_store.dart';

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
    return MainScaffoldWidget(body: Container());
  }
}

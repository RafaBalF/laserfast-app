import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/home/pages/profile/profile_store.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});
  @override
  AgendaPageState createState() => AgendaPageState();
}

class AgendaPageState extends State<AgendaPage> {
  final ProfileStore _store = Modular.get<ProfileStore>();

  @override
  void initState() {
    _store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleScaffoldWidget(title: 'AGENDAMENTO', body: Container());
  }
}

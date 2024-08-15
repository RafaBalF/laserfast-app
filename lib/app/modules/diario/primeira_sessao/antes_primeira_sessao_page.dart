import 'package:flutter/material.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';

class AntesPrimeiraSessaoPage extends StatefulWidget {
  const AntesPrimeiraSessaoPage({super.key});
  @override
  AntesPrimeiraSessaoPageState createState() => AntesPrimeiraSessaoPageState();
}

class AntesPrimeiraSessaoPageState extends State<AntesPrimeiraSessaoPage> {
  @override
  Widget build(BuildContext context) {
    return const SimpleScaffoldWidget(
      title: "Antes da 1° sessão",
      body: Column(
        children: [],
      ),
    );
  }
}

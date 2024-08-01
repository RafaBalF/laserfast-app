import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:laserfast_app/app/models/auth.model.dart';
import 'package:laserfast_app/app/models/credit_cards.model.dart';
import 'package:laserfast_app/app_module.dart';
import 'package:laserfast_app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR');

  await Hive.initFlutter();

  Hive.registerAdapter(AuthModelAdapter());
  Hive.registerAdapter(CreditCardsModelAdapter());

  await Hive.openBox('login');
  await Hive.openBox('app_presentation');
  await Hive.openBox('credit_cards');

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

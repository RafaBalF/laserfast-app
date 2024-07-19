import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:compregados_app_v2/app/models/auth.model.dart';
import 'package:compregados_app_v2/app_module.dart';
import 'package:compregados_app_v2/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR');
  await Hive.initFlutter();
  Hive.registerAdapter(AuthModelAdapter());
  await Hive.openBox('login');
  await Hive.openBox('app_presentation');
  await Hive.openBox('address');
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

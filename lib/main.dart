import 'package:flutter/material.dart';
import 'package:Projeto02/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';

//void main() => runApp(ModularApp(module: AppModule()));
void main() {
  initializeDateFormatting()
      .then((_) => runApp(ModularApp(module: AppModule())));
}

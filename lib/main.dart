import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/infra/get_it_config.dart';

import 'app/app_widget.dart';

void main() {
  GetItConfig getItconfig = GetItConfig();

  getItconfig.registerControllers();

  runApp(const AppWidget());
}

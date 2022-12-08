import 'package:flutter/material.dart';

import 'app/app_widget.dart';
import 'infra/get_it_config.dart';

void main() {
  GetItConfig getItconfig = GetItConfig();

  getItconfig.initGetIt();

  runApp(const AppWidget());
}

import 'package:get_it/get_it.dart';

import '../controllers/home_controller.dart';

class GetItConfig {
  void registerControllers() {
    GetIt.I.registerFactory(() => HomeController());
  }
}

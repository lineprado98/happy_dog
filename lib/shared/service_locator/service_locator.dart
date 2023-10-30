import 'package:get_it/get_it.dart';

class ServiceLocator {
  final getIt = GetIt.instance;

  static void setup() {
//   getIt.registerSingleton<AppModel>(AppModel());

// // Alternatively you could write it if you don't like global variables
//   GetIt.I.registerSingleton<AppModel>(AppModel());
  }
}

import 'package:get_it/get_it.dart';

import 'core/service/location_service.dart';
import 'core/service/weatherservice.dart';

final locator = GetIt.instance;

void setupocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LocationService());
}

import 'package:get_it/get_it.dart';

import 'core/service/location_service.dart';
import 'core/service/weatherservice.dart';

GetIt locator = GetIt.instance;

void setuplocator() {
  locator.registerLazySingleton<Api>(() => Api());
  locator.registerLazySingleton<LocationService>(() => LocationService());
}

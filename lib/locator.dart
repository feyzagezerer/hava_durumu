import 'package:get_it/get_it.dart';
import 'package:hava_durumu/data/weather_api_client.dart';
import 'package:hava_durumu/data/weather_repository.dart';

GetIt locator = GetIt.instance;
void setupLocation() {
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
}

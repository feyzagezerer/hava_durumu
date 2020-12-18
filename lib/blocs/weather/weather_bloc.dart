import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hava_durumu/data/weather_repository.dart';
import 'package:hava_durumu/locator.dart';
import 'package:hava_durumu/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());
  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try {
        final Weather getirilenweather =
            await weatherRepository.getWeather(event.sehirAdi);
        yield WeatherLoadedState(weather: getirilenweather);
      } catch (_) {
        yield WeatherErrorState();
      }
    } else if (event is RefreshWeatherEvent) {
      try {
        final Weather getirilenweather =
            await weatherRepository.getWeather(event.sehirAdi);
        yield WeatherLoadedState(weather: getirilenweather);
      } catch (_) {
        yield state;
      }
    }
  }
}

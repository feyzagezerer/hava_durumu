part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadedState extends WeatherState {
  Weather weather;
  WeatherLoadedState({@required this.weather});

  @override
  List<Object> get props => [
        weather.title,
        weather.time,
        weather.locationType,
        weather.woeid,
        weather.lattLong,
        weather.consolidatedWeather,
        weather.sources
      ];
}

class WeatherErrorState extends WeatherState {
  @override
  List<Object> get props => [];
}

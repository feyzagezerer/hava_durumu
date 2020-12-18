part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent {
  final String sehirAdi;

  FetchWeatherEvent({@required this.sehirAdi});

  @override //burdaki
  // TODO: implement props //olaydan
  List<Object> get props => [sehirAdi]; //emin değilim
}

class RefreshWeatherEvent extends WeatherEvent {
  final String sehirAdi;

  RefreshWeatherEvent({@required this.sehirAdi});

  @override
  // TODO: implement props
  List<Object> get props => [sehirAdi];
}

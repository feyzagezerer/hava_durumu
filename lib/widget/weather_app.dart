import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hava_durumu/blocs/weather/weather_bloc.dart';
import 'package:hava_durumu/widget/city_select.dart';
import 'package:hava_durumu/widget/last_update.dart';
import 'package:hava_durumu/widget/location.dart';
import 'package:hava_durumu/widget/max_min_temperature.dart';
import 'package:hava_durumu/widget/weather_picture.dart';

class WeatherApp extends StatelessWidget {
  String kullanicininSectigiSehir = "Ankara";
  Completer<void> _refreshCompleter = Completer<void>();
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Hava Durumu"),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final String kullanicininSectigiSehir = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SehirSecWidget()),
                );
                // debugPrint("secilen sehir " + kullanicininSectigiSehir);
                if (kullanicininSectigiSehir != null) {
                  _weatherBloc.add(
                      FetchWeatherEvent(sehirAdi: kullanicininSectigiSehir));
                }
              }),
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (BuildContext context, WeatherState state) {
            if (state is WeatherInitial) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "\tÇeşitli hava durumu tahmincilerinden hava durumu tahminlerini alan ve en olası sonucu hesaplayıp sizlere gösteren Hava Durumu'na hoş geldiniz.\n\n \t "
                    "Hava durumunu öğrenmek istediğiniz şehrin adını, yukarıdaki arama yerine yazın.",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );
            }

            if (state is WeatherLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is WeatherLoadedState) {
              final getirilenWeather = state.weather;
              _refreshCompleter.complete();
              _refreshCompleter = Completer();

              return RefreshIndicator(
                onRefresh: () {
                  _weatherBloc.add(
                      RefreshWeatherEvent(sehirAdi: getirilenWeather.title));
                  return _refreshCompleter.future;
                },
                child: ListView(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: LocationWidget(
                            secilenSehir: getirilenWeather.title,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: LastUpdateWidget()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: WeatherPictureWidget()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(child: MaxMinTemperatureWidget()),
                    ),
                  ],
                ),
              );
            }
            if (state is WeatherErrorState) {
              return Center(
                child: Text("Veri getirilemedi"),
              );
            }
            return Center(
              child: Text("Veri getirilemedi"),
            );
          },
        ),
      ),
    );
  }
}

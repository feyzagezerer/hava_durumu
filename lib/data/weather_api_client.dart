import 'dart:convert';

import 'package:hava_durumu/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com/";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String sehirAdi) async {
    final sehirURL = baseUrl + "/api/location/search/?query=" + sehirAdi;
    final gelenCevap = await httpClient.get(sehirURL);

    if (gelenCevap.statusCode != 200) {
      throw Exception("Veri Getirilemedi");
    }
    final gelenCevapJSON =
        (jsonDecode(gelenCevap.body)) as List; //liste olduğunu belirtildi
    return gelenCevapJSON[0]
        ["woeid"]; //0.indeksindeki woeid değerini dönder çünkü ID lazım
  }

  Future<Weather> getWeather(int sehirID) async {
    final havaDurumuURL = baseUrl + "/api/location/$sehirID";
    final havaDurumuGelenCevap = await httpClient.get(havaDurumuURL);
    if (havaDurumuGelenCevap.statusCode != 200) {
      throw Exception("Hava durumu getirilemedi");
    }
    final havaDurumuCevapJSON = jsonDecode(havaDurumuGelenCevap.body);
    return Weather.fromJson(havaDurumuCevapJSON);
  }
}

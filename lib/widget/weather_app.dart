import 'package:flutter/material.dart';
import 'package:hava_durumu/widget/last_update.dart';
import 'package:hava_durumu/widget/location.dart';
import 'package:hava_durumu/widget/max_min_temperature.dart';
import 'package:hava_durumu/widget/weather_picture.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hava Durumu"),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: LocationWidget()),
            ),
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
      ),
    );
  }
}

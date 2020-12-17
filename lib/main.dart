import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hava_durumu/blocs/weather/weather_bloc.dart';
import 'package:hava_durumu/locator.dart';
import 'package:hava_durumu/widget/weather_app.dart';

void main() {
  setupLocation();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hava Durumu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(), child: WeatherApp()),
    );
  }
}

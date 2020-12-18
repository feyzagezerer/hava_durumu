import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hava_durumu/blocs/weather/weather_bloc.dart';

class LastUpdateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, WeatherState state) {
      var newDate = (state as WeatherLoadedState)
          .weather
          .time
          .toLocal(); //kullanıcının telefonundaki saat dilimine göre

      return Text(
        'Son güncelleme ' + TimeOfDay.fromDateTime(newDate).format(context),
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      );
    });
  }
}

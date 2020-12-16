import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastUpdateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Son güncelleme ' + TimeOfDay(hour: 20, minute: 35).format(context),
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
    );
  }
}

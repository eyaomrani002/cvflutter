import 'package:flutter/material.dart';
class ProgressBarCustom extends StatelessWidget {
  final String skill;
  final String porcentaje;
  final Color color;
  final double barra;

  ProgressBarCustom({
    required this.skill,
    required this.porcentaje,
    required this.color,
    required this.barra,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          skill,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(height: 10.0),
        LinearProgressIndicator(
          value: double.parse(porcentaje) / 100,
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
        SizedBox(height: 10.0),
        Text(
          '$porcentaje%',
          style: TextStyle(color: color, fontSize: 16),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/widgets/split_content_card.dart';

class TemperatureContent extends StatelessWidget {
  const TemperatureContent({
    Key? key,
    required this.temperature,
  }) : super(key: key);

  final double temperature;

  @override
  Widget build(BuildContext context) {
    return SplitContentCard(
      icon: Icons.thermostat,
      title: "$temperature °C  ",
      subtitle: "Inside",
    );
  }
}

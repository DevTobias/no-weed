import 'package:flutter/material.dart';
import 'package:frontend/widgets/split_content_card.dart';

class LightContent extends StatelessWidget {
  const LightContent({
    Key? key,
    required this.lightLevel,
  }) : super(key: key);

  final int? lightLevel;

  @override
  Widget build(BuildContext context) {
    return SplitContentCard(
      icon: Icons.light,
      title: "Light",
      subtitle: lightLevel != null ? "$lightLevel Lumens" : "-",
    );
  }
}

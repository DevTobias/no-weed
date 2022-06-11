import 'package:flutter/material.dart';
import 'package:frontend/widgets/split_content_card.dart';

class MoistureContent extends StatelessWidget {
  const MoistureContent({
    Key? key,
    required this.moisture,
  }) : super(key: key);

  final int moisture;

  @override
  Widget build(BuildContext context) {
    return SplitContentCard(
      icon: Icons.water_drop,
      title: "Moisture",
      subtitle: "$moisture %",
    );
  }
}

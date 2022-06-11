import 'package:flutter/material.dart';
import 'package:frontend/theme/weed_colors.dart';
import 'package:frontend/theme/weed_text_style.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class WaterLevelContent extends StatelessWidget {
  const WaterLevelContent({
    Key? key,
    required this.waterLevel,
  }) : super(key: key);

  final int waterLevel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LiquidCircularProgressIndicator(
        value: waterLevel / 100,
        valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
        backgroundColor: WeedColors.warmGreyExtraLight,
        center: Text(
          "42%",
          style: WeedTextTheme.of(context).bodyMedium.bold.dark,
        ),
      ),
    );
  }
}

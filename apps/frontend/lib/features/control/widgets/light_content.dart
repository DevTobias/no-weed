import 'package:flutter/material.dart';
import 'package:frontend/theme/weed_text_style.dart';
import 'package:gap/gap.dart';

class LightContent extends StatelessWidget {
  const LightContent({
    Key? key,
    required this.lightLevel,
  }) : super(key: key);

  final int lightLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.light),
        Gap(10),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Light",
                style: WeedTextTheme.of(context).bodyMedium.bold,
              ),
              Text(
                "$lightLevel Lumens",
                style: WeedTextTheme.of(context).bodySmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}

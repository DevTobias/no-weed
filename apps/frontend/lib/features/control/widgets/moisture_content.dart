import 'package:flutter/material.dart';
import 'package:frontend/theme/weed_text_style.dart';
import 'package:gap/gap.dart';

class MoistureContent extends StatelessWidget {
  const MoistureContent({
    Key? key,
    required this.moisture,
  }) : super(key: key);

  final int moisture;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.water_drop),
        Gap(10),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Moisture",
                style: WeedTextTheme.of(context).bodyMedium.bold,
              ),
              Text(
                "$moisture %",
                style: WeedTextTheme.of(context).bodySmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}

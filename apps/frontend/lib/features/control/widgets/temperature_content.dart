import 'package:flutter/material.dart';
import 'package:frontend/theme/weed_colors.dart';
import 'package:frontend/theme/weed_text_style.dart';
import 'package:gap/gap.dart';

class TemperatureContent extends StatelessWidget {
  const TemperatureContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.thermostat),
        Gap(10),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "20.8",
                      style: WeedTextTheme.of(context).bodyMedium.bold,
                    ),
                    TextSpan(
                      text: " °C  ",
                      style: WeedTextTheme.of(context).bodyMedium.bold.copyWith(
                            color: WeedColors.charcoalLight,
                          ),
                    ),
                  ],
                ),
              ),
              Text(
                "Inside",
                style: WeedTextTheme.of(context).bodySmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}

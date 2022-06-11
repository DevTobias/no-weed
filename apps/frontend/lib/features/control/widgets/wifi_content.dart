import 'package:flutter/material.dart';
import 'package:frontend/theme/weed_colors.dart';
import 'package:frontend/theme/weed_text_style.dart';
import 'package:gap/gap.dart';

class WifiContent extends StatelessWidget {
  const WifiContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.wifi),
        Gap(10),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "WiFi",
                style: WeedTextTheme.of(context).bodyMedium.bold,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: WeedColors.systemGreen,
                  ),
                  Gap(3),
                  Text(
                    "Connected",
                    style: WeedTextTheme.of(context).bodySmall,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

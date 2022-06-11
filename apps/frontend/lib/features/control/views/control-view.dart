import 'package:flutter/material.dart';
import 'package:frontend/features/control/widgets/control-header.dart';
import 'package:frontend/features/control/widgets/info_card.dart';
import 'package:frontend/features/control/widgets/light_content.dart';
import 'package:frontend/features/control/widgets/moisture_content.dart';
import 'package:frontend/features/control/widgets/quick_control_content.dart';
import 'package:frontend/features/control/widgets/split_info_card.dart';
import 'package:frontend/features/control/widgets/temperature_content.dart';
import 'package:frontend/features/control/widgets/water_level_content.dart';
import 'package:frontend/features/control/widgets/wifi_content.dart';
import 'package:frontend/theme/weed_text_style.dart';
import 'package:gap/gap.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ControlHeader(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Gap(20),
            Text(
              "Control Center",
              style: WeedTextTheme.of(context).headline2.bold,
            ),
            Gap(20),
            Row(
              children: [
                Expanded(
                  child: SplitInfoCard(
                    top: TemperatureContent(),
                    bottom: MoistureContent(),
                  ),
                ),
                Gap(20),
                Expanded(
                  child: SplitInfoCard(
                    top: LightContent(),
                    bottom: WifiContent(),
                  ),
                ),
              ],
            ),
            Gap(20),
            Row(
              children: [
                Expanded(
                  child: InfoCard(
                    body: WaterLevelContent(),
                  ),
                ),
                Gap(20),
                Expanded(
                  child: InfoCard(
                    body: QuickControlContent(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

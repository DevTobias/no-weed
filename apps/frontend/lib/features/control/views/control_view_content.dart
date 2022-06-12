import 'package:flutter/material.dart';
import 'package:frontend/features/control/model/control_model.dart';
import 'package:frontend/widgets/info_card.dart';
import 'package:frontend/features/control/widgets/content/light_content.dart';
import 'package:frontend/features/control/widgets/light_interval.dart';
import 'package:frontend/features/control/widgets/content/moisture_content.dart';
import 'package:frontend/features/control/widgets/quick_control_content.dart';
import 'package:frontend/widgets/split_info_card.dart';
import 'package:frontend/features/control/widgets/content/temperature_content.dart';
import 'package:frontend/features/control/widgets/water_level_content.dart';
import 'package:frontend/features/control/widgets/content/wifi_content.dart';
import 'package:frontend/theme/weed_text_style.dart';
import 'package:gap/gap.dart';

class ControlViewContent extends StatelessWidget {
  const ControlViewContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ControlModel? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  top: TemperatureContent(temperature: data?.temperature),
                  bottom: MoistureContent(humidity: data?.humidity),
                ),
              ),
              Gap(20),
              Expanded(
                child: SplitInfoCard(
                  top: LightContent(lightLevel: data?.lightLevel),
                  bottom: WifiContent(connected: data != null),
                ),
              ),
            ],
          ),
          Gap(20),
          Row(
            children: [
              Expanded(
                child: InfoCard(
                  body: WaterLevelContent(waterLevel: data?.waterLevel ?? 0),
                ),
              ),
              Gap(20),
              Expanded(
                child: InfoCard(
                  body: QuickControlContent(),
                ),
              ),
            ],
          ),
          Gap(20),
          LightInterval(
            startHour: data?.startHour ?? 0,
            endHour: data?.endHour ?? 0,
            startMinute: data?.startMinute ?? 0,
            endMinute: data?.endMinute ?? 0,
          ),
        ],
      ),
    );
  }
}

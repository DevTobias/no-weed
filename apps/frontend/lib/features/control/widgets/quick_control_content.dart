import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/features/control/service/control_service.dart';
import 'package:frontend/features/control/viewmodel/control_viewmodel.dart';
import 'package:frontend/theme/weed_text_style.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuickControlContent extends ConsumerWidget {
  const QuickControlContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleChange(bool val) {
      ref.read(AllCollectionsViewmodel.lightsProvider.notifier).setIsLight(val);
      ref.read(ControlService.controlProvider).persistLightMode(val);
    }

    void handlePlant() {
      ref.read(ControlService.controlProvider).waterPlant();
    }

    final lightEnabled = ref.watch(AllCollectionsViewmodel.lightsProvider);

    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Quick Control",
            style: WeedTextTheme.of(context).bodyMedium.bold,
          ),
          Row(
            children: [
              Text(
                "Light off",
                style: WeedTextTheme.of(context).bodySmall,
              ),
              CupertinoSwitch(value: lightEnabled, onChanged: handleChange),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              minimumSize: const Size.fromHeight(30),
            ),
            onPressed: handlePlant,
            child: Text("Water Plant"),
          )
        ],
      ),
    );
  }
}

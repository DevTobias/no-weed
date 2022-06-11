import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/features/control/service/control_service.dart';
import 'package:frontend/widgets/info_card.dart';
import 'package:frontend/theme/weed_text_style.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class LightInterval extends ConsumerWidget {
  const LightInterval({
    Key? key,
    required this.startHour,
    required this.endHour,
    required this.startMinute,
    required this.endMinute,
  }) : super(key: key);

  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDate = DateTime(2022, 07, 12, startHour, startMinute);
    final endDate = DateTime(2022, 07, 12, endHour, endMinute);

    return InfoCard(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Light phase",
              style: WeedTextTheme.of(context).bodyMedium.bold,
            ),
            Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start",
                      style: WeedTextTheme.of(context).bodySmall.bold,
                    ),
                    OutlinedButton(
                      onPressed: () =>
                          iosDatePicker(context, ref, true, startDate),
                      child: Text(
                        DateFormat("kk:mm").format(startDate),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "End",
                      style: WeedTextTheme.of(context).bodySmall.bold,
                    ),
                    OutlinedButton(
                      onPressed: () =>
                          iosDatePicker(context, ref, false, endDate),
                      child: Text(
                        DateFormat("kk:mm").format(endDate),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  iosDatePicker(
      BuildContext context, WidgetRef ref, bool isStart, DateTime initial) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height * 0.20,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            onDateTimeChanged: (value) {
              ref
                  .read(ControlService.controlProvider)
                  .persistLightInterval(isStart, value);
            },
            initialDateTime: initial,
          ),
        );
      },
    );
  }
}

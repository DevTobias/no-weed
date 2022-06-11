import 'package:flutter/material.dart';
import 'package:frontend/theme/weed_text_style.dart';
import 'package:gap/gap.dart';

class SplitContentCard extends StatelessWidget {
  const SplitContentCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.subtitlePrefix,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? subtitlePrefix;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        Gap(10),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: WeedTextTheme.of(context).bodyMedium.bold,
              ),
              Row(
                children: [
                  if (subtitlePrefix != null) subtitlePrefix!,
                  if (subtitlePrefix != null) Gap(4),
                  Text(
                    subtitle,
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

import 'package:flutter/material.dart';
import 'package:frontend/theme/weed_colors.dart';
import 'package:frontend/widgets/split_content_card.dart';

class WifiContent extends StatelessWidget {
  const WifiContent({
    Key? key,
    this.connected = false,
  }) : super(key: key);

  final bool connected;

  @override
  Widget build(BuildContext context) {
    return SplitContentCard(
      icon: Icons.wifi,
      title: "WiFi",
      subtitle: connected ? "Connected" : "Invalid",
      subtitlePrefix: Container(
        margin: EdgeInsets.only(top: 4),
        child: CircleAvatar(
          radius: 5,
          backgroundColor: _statusColor,
        ),
      ),
    );
  }

  Color get _statusColor =>
      connected ? WeedColors.systemGreen : WeedColors.systemRed;
}

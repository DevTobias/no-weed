import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/theme/weed_text_style.dart';

class QuickControlContent extends StatelessWidget {
  const QuickControlContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              CupertinoSwitch(value: false, onChanged: (bool val) {}),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              minimumSize: const Size.fromHeight(30),
            ),
            onPressed: () {},
            child: Text("Water Plant"),
          )
        ],
      ),
    );
  }
}

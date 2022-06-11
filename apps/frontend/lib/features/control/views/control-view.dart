import 'package:flutter/material.dart';
import 'package:frontend/features/control/widgets/control-header.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ControlHeader(),
    );
  }
}

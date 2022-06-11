import 'package:flutter/material.dart';
import 'package:frontend/features/control/views/control-view.dart';
import 'package:frontend/theme/weed_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: WeedTheme.getLightTheme(context),
      darkTheme: WeedTheme.getDarkTheme(context),
      home: const ControlView(),
    );
  }
}

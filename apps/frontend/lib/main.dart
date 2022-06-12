import 'package:flutter/material.dart';
import 'package:frontend/features/welcome/views/welcome_view.dart';
import 'package:frontend/theme/weed_text_style.dart';
import 'package:frontend/theme/weed_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      home: ProviderScope(
        child: WeedTextTheme(
          child: WelcomeView(),
        ),
      ),
    );
  }
}

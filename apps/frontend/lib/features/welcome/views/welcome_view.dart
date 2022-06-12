import 'package:flutter/material.dart';
import 'package:frontend/features/navigation/widgets/bottom_navigation.dart';
import 'package:frontend/theme/weed_text_style.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleClick() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProviderScope(
            child: WeedTextTheme(
              child: BottomNavigation(),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/plant_logo.png"),
                Gap(100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to No Weed. Your friendly Greenhouse of the neighbourhood.",
                      style: WeedTextTheme.of(context).headline2.bold,
                      textAlign: TextAlign.center,
                    ),
                    Gap(50),
                    Text(
                      "Before you can start, please enter the product number from the back of the no weed greenhouse.",
                      style: WeedTextTheme.of(context).bodyLarge,
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Product Number',
                            ),
                          ),
                        ),
                        Gap(20),
                        SizedBox(
                          height: 60,
                          child: ElevatedButton.icon(
                            onPressed: handleClick,
                            icon: Icon(Icons.send),
                            label: Text("Enter"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

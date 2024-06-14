import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/onboarding_controller.dart';
import '../widgets/onboarding_buttons.dart';
import '../widgets/dot_builder.dart';
import '../widgets/onboarding_slider.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnBoardingController>(context);

    controller.context = context;

    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Slider
              Expanded(
                flex: 3,
                child: OnBoardingSlider(),
              ),
              // Dots And Buttons
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    // Dots
                    DotBuilder(),
                    SizedBox(height: 50),
                    // Buttons
                    OnBoardingButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

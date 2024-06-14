import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../providers/onboarding_controller.dart';

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnBoardingController>(context);

    return Row(
      children: [
        // Skip Button
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/loginScreen");
          },
          child: const Text("Skip"),
        ),
        const Spacer(),
        // Next Button
        MaterialButton(
          onPressed: () {
            controller.nextPage();
          },
          color: AppColor.orangecol,
          textColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text("Next"),
        ),
      ],
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/static_data.dart';
import '../providers/onboarding_controller.dart';

class DotBuilder extends StatelessWidget {
  const DotBuilder({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingController>(
      builder: (context, controller, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(right: 5),
              width: controller.currentPage == index ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: controller.currentPage == index
                    ? AppColor.orangecol
                    : AppColor.greencol,
              ),
            ),
          ),
        );
      },
    );
  }
}

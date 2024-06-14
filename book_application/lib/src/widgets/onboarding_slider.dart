// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/static_data.dart';
import '../providers/onboarding_controller.dart';

class OnBoardingSlider extends StatelessWidget {
  const OnBoardingSlider({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnBoardingController>(context);

    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) {
        String title = onBoardingList[i].title;
        List<TextSpan> spans = getSpans(
          title,
          ["indoor & outdoor", "alive", "earth"],
        );
        return Column(
          children: [
            const Spacer(),
            Image(
              height: 400,
              image: AssetImage(onBoardingList[i].image),
            ),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: spans,
              ),
            ),
            const SizedBox(height: 20),
            Text(onBoardingList[i].subTitle),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  List<TextSpan> getSpans(String text, List<String> keywords) {
    List<TextSpan> spans = [];
    int start = 0;

    while (start < text.length) {
      int closestIndex = text.length;
      String? closestKeyword;

      for (String keyword in keywords) {
        int index = text.indexOf(keyword, start);
        if (index != -1 && index < closestIndex) {
          closestIndex = index;
          closestKeyword = keyword;
        }
      }

      if (closestKeyword == null) {
        spans.add(
          TextSpan(
            text: text.substring(start),
            style: buildTextStyle(AppColor.blackcol),
          ),
        );
        break;
      }

      if (closestIndex > start) {
        spans.add(
          TextSpan(
            text: text.substring(start, closestIndex),
            style: buildTextStyle(AppColor.greencol),
          ),
        );
      }

      spans.add(
        TextSpan(
          text: closestKeyword,
          style: buildTextStyle(AppColor.orangecol),
        ),
      );

      start = closestIndex + closestKeyword.length;
    }

    return spans;
  }

  TextStyle buildTextStyle(Color color) {
    return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
}

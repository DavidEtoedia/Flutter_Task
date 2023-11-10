import 'package:flutter/material.dart';
import 'package:flutter_task/model/onboarding_model.dart';
import 'package:flutter_task/ui/onboarding/welcome_screen.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/button/main_button.dart';
import 'package:flutter_task/utils/navigator/navigator.dart';
import 'package:flutter_task/utils/spacer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller =
      PageController(viewportFraction: 1.0, keepPage: true);
  int pageCount = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClickableText(
                  color: AppColors.primaryColor,
                  text: "Skip",
                  onPressed: () =>
                      context.navigateReplaceRoot(const WelcomeScreen())),
              Expanded(
                  child: PageView.builder(
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      allowImplicitScrolling: true,
                      controller: controller,
                      onPageChanged: (value) {
                        setState(() => pageCount = value);
                      },
                      itemCount: onboarding.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: size.height * 0.4,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(onboarding[index].image))),
                            ),
                            const Space(20),
                            Text(
                              onboarding[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 20,
                                    fontWeight: AppFontWeight.bold,
                                  ),
                            ),
                            const Space(15),
                            Text(
                              onboarding[index].content,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: AppFontWeight.regular,
                                  ),
                            ),
                          ],
                        );
                      })),
              Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: onboarding.length,
                  effect: WormEffect(
                      dotColor: AppColors.primaryColor.withOpacity(0.3),
                      activeDotColor: AppColors.primaryColor,
                      dotHeight: 10,
                      dotWidth: 10),
                ),
              ),
              Space(size.height * 0.15),
              MainButton(
                text: pageCount == 2 ? "Get Started" : "Next",
                onPressed: () {
                  if (pageCount == 2) {
                    context.navigateReplaceRoot(const WelcomeScreen());
                  }
                  controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
              ),
              const Space(40),
            ],
          ),
        ),
      ),
    );
  }
}

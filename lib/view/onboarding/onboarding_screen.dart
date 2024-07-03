import 'package:fitnest_x/blocs/onboarding_bloc.dart';
import 'package:fitnest_x/res/colors.dart';
import 'package:fitnest_x/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/components/gradient_circular_progress_indicator.dart';

class Onboarding extends StatelessWidget {
  const Onboarding();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen();

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  void _onNextPage() {
    setState(() {
      if (currentPage < 3) {
        currentPage++;
        _pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Widget Build");
    double progress = (currentPage + 1) / 4; // 4 pages total
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        int currentPage = 0;
        if (state is OnboardingStep) {
          currentPage = state.step;
        }
        double progress = (currentPage + 1) / 4; // 4 pages total

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    if (page > currentPage) {
                      context.read<OnboardingBloc>().add(OnboardingNext());
                    } else if (page < currentPage) {
                      context.read<OnboardingBloc>().add(OnboardingPrevious());
                    }
                  },
                  children: const [
                    OnBoardingPage(
                      imageUrl: "assets/images/onboard1.svg",
                      title: AppString.trackGoal,
                      description: AppString.goalDescription,
                    ),
                    OnBoardingPage(
                      imageUrl: "assets/images/onboard2.svg",
                      title: AppString.getBurn,
                      description: AppString.burnDescription,
                    ),
                    OnBoardingPage(
                      imageUrl: "assets/images/onboard3.svg",
                      title: AppString.eatWell,
                      description: AppString.eatDescription,
                    ),
                    OnBoardingPage(
                      imageUrl: "assets/images/onboard4.svg",
                      title: AppString.sleepQuality,
                      description: AppString.sleepDescription,
                    ),
                  ],
                ),
                Positioned(
                    right: 20,
                    bottom: 20,
                    child: GradientCircularProgressIndicator(
                      progress: progress,
                      onPressed: () {
                        if (currentPage < 3) {
                          context.read<OnboardingBloc>().add(OnboardingNext());
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        } else {
                          context
                              .read<OnboardingBloc>()
                              .add(OnboardingFinish());
                        }
                      },
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const OnBoardingPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 480),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColor.blackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColor.grayColor1,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handsin/Authentication&Registratino/login.dart';
import 'package:handsin/Authentication&Registratino/register.dart';
import 'package:handsin/Constants/app_images.dart';
import 'package:handsin/Pages/UserPages/models/onboarding.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _activePage = 0;

  final List<Onboarding> _slides = [
    const Onboarding(
      title: "Welcome to Hands-In!",
      description:
          "Got a Problem you can't solve? Post it and get some help",
      image: AppImages.slide1,
    ),
    const Onboarding(
      title: "Meet up  with your Tutor",
      description:
          "Find a tutor, agree on location to meet",
      image: AppImages.slide2,
    ),
    const Onboarding(
      title: "Get the help you need",
      description:
          "Getting help with your problems in school has never been easier",
      image: AppImages.slide3,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() => _activePage = page);
              },
              itemCount: _slides.length,
              itemBuilder: (context, index) {
                final image = _slides[index].image;
                return Image.asset(image, fit: BoxFit.cover);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Begin: Page Indicator
              children: List<Widget>.generate(
                _slides.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 9),
                  child: InkWell(
                    onTap: () {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: AnimatedContainer(
                      height: 9,
                      width: 9,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _activePage == index
                            ? theme.primaryColor
                            : theme.indicatorColor,
                      ),
                      // indicate active page
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Column(
                    children: [
                      Text(
                        _slides[_activePage].title,
                        style: theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.visible,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        _slides[_activePage].description,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Create an account"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  child: Text("Log in"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ui_app_v1/Sreens/home_screen.dart';
//import 'package:flutter_svg/svg.dart';
import '../widgets/onboarding.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  //To keep track of the page we are on
  PageController _controller = PageController();
  // To keep track if we are on the last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: Stack(
            children: [
              PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    onLastPage = index == 3;
                  });
                },
                children: [
                  OnBoardingWidget(
                      image: 'assets/img/product design_debug.svg',
                      title: 'Learn UI/UX Design',
                      subtitle:
                          'The UI/UX Design Specialisation brings a design-centric approach to user interface and user experience design, and offers practical.'),
                  OnBoardingWidget(
                      image: 'assets/img/web development_AuthPage.svg',
                      title: 'Learn Web Development',
                      subtitle:
                          'Rivasult is a free scholarship programme enabling African youth with tech up-skilling & jobs. Africa & African youth are poised to transform the digital landscape of the world.'),
                  OnBoardingWidget(
                      image: 'assets/img/graphics design_pull.svg',
                      title: 'Learn Graphics Design',
                      subtitle:
                          'Master all aspects of graphic design by enrolling in courses that will train you in typography, Learn in-demand skills with over 185,000 video courses.'),
                  OnBoardingWidget(
                      image: 'assets/img/Mobile Development_sitting.svg',
                      title: 'Learn Mobile App Development',
                      subtitle:
                          'Take online app development courses from top schools and institutions. Learn app development skills to advance your education and career with Rivasult.'),
                ],
              ),
              Container(
                alignment: Alignment(0, 0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      effect: ExpandingDotsEffect(
                          activeDotColor: Colors.blue.shade400),
                      onDotClicked: (index) => _controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(right: 25, top: 45),
                child: TextButton(
                  child: Text('SKIP'),
                  onPressed: () => _controller.jumpToPage(3),
                ),
              )
            ],
          ),
        ),
        bottomSheet: onLastPage
            ? TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(10),
                            topStart: Radius.circular(10))),
                    primary: Colors.white,
                    backgroundColor: Colors.blue.shade700,
                    minimumSize: Size.fromHeight(80)),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            : Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 55),
                            primary: Colors.grey.shade300,
                            onPrimary: Colors.grey),
                        onPressed: () {
                          _controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text('Back')),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 55),
                          // primary: Colors.grey.shade300,
                          // onPrimary: Colors.grey
                        ),
                        onPressed: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text('Next')),
                  ],
                ),
              ));
  }
}

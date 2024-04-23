import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/controller/cubit/home_cubit.dart';
import 'package:flutter_application_3/controller/states/home_states.dart';
import 'package:flutter_application_3/core/sharedPre.dart';
import 'package:flutter_application_3/view/Register_screen.dart';
import 'package:flutter_application_3/view/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit controller = HomeCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Expanded(
                      child: PageView.builder(
                    controller: controller.pageController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return controller.Pages[controller.nextpadecurrent];
                    },
                    itemCount: controller.Pages.length,
                    onPageChanged: (index) {
                      controller.getNextPage(index);
                      if (controller.nextpadecurrent ==
                          controller.pages.length - 1) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Register(),
                        ));
                      }
                    },
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmoothPageIndicator(
                        controller: controller.pageController,
                        count: controller.Pages.length,
                        effect: const ExpandingDotsEffect(
                          dotHeight: 16,
                          dotWidth: 16,
                        ),
                        onDotClicked: (index) {
                          controller.getPage(index);
                          if (controller.indexpage > 3) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Register(),
                            ));
                          }
                        },
                      ),
                      const SizedBox(width: 20),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          onPressed: () {
                            print(controller.nextpadecurrent);
                            if (controller.nextpadecurrent !=
                                controller.pages.length - 1) {
                              controller.pageController.nextPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastEaseInToSlowEaseOut,
                              );
                              print("second");
                            } else {
                              HelperSharedPreference.setString(
                                  key: 'stapes', value: '1');
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Register(),
                              ));
                            }
                          },
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PageWidget extends StatelessWidget {
  const PageWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final Image image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: width, height: height / 2, child: image),
        SizedBox(height: 10),
        SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Text(
            subtitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

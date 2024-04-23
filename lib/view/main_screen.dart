import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/controller/cubit/home_cubit.dart';
import 'package:flutter_application_3/controller/states/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        HomeCubit controller = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey,
          body: Stack(
            children: [
              controller.pages[controller.currentIndex],
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  height: width * .155,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: width * .02),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        controller.changeBottomNav(index);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Stack(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == controller.currentIndex
                                ? width * .32
                                : width * .18,
                            alignment: Alignment.center,
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              height: index == controller.currentIndex
                                  ? width * .12
                                  : 0,
                              width: index == controller.currentIndex
                                  ? width * .32
                                  : 0,
                              decoration: BoxDecoration(
                                color: index == controller.currentIndex
                                    ? Colors.blueAccent.withOpacity(.2)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == controller.currentIndex
                                ? width * .31
                                : width * .18,
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      width: index == controller.currentIndex
                                          ? width * .13
                                          : 0,
                                    ),
                                    AnimatedOpacity(
                                      opacity: index == controller.currentIndex
                                          ? 1
                                          : 0,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: Text(
                                        index == controller.currentIndex
                                            ? controller.listOfStrings[index]
                                            : '',
                                        style: const TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      width: index == controller.currentIndex
                                          ? width * .03
                                          : 20,
                                    ),
                                    Icon(
                                      controller.listOfIcons[index],
                                      size: width * .076,
                                      color: index == controller.currentIndex
                                          ? const Color(0xffe84e4e)
                                          : Colors.grey[500],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

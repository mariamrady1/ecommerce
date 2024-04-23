import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/controller/cubit/register_cubit.dart';
import 'package:flutter_application_3/controller/states/login_register_states.dart';
import 'package:flutter_application_3/view/login_screen.dart';
import 'package:flutter_application_3/view/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/cubit/login_cubit.dart';
import '../core/sharedPre.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  Register();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GlobalKey<FormState> emailglobalKey = GlobalKey();
  GlobalKey<FormState> passwordglobalKey = GlobalKey();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  GlobalKey<FormState> nameglobalKey = GlobalKey();
  GlobalKey<FormState> numberglobalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.sizeOf(context).height;
    return BlocConsumer<LoginRegisterCubit, LoginRedisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessStates) {
          if (state.model1.status!) {
            Fluttertoast.showToast(msg: state.model1.message!);
            HelperSharedPreference.setString(key: 'stapes', value: '2');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          } else if (state is RegisterErrorStates) {
            Fluttertoast.showToast(msg: state.model1.message!);
          }
        }
      },
      builder: (context, state) {
        LoginRegisterCubit controller = LoginRegisterCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              Image.asset(
                'images/Mariam.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height1 / 10, horizontal: height1 / 25),
                  child: SizedBox(
                    height: height1 / 1.25,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black.withOpacity(.86),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(height1 / 50, height1 / 10,
                            height1 / 50, height1 / 50),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height1 / 20),
                              ),
                            ),
                            const Spacer(
                              flex: 3,
                            ),
                            Expanded(
                              flex: 3,
                              child: Form(
                                key: nameglobalKey,
                                child: TextFormField(
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return "You must enter your name";
                                  //   } else if (value.length < 1) {
                                  //     return "You should enter a valid name";
                                  //   }
                                  // },
                                  style: const TextStyle(color: Colors.white),
                                  controller: namecontroller,
                                  onFieldSubmitted: (value) {
                                    if (emailglobalKey.currentState!
                                            .validate() &&
                                        passwordglobalKey.currentState!
                                            .validate() &&
                                        nameglobalKey.currentState!
                                            .validate() &&
                                        numberglobalKey.currentState!
                                            .validate()) {
                                      controller.getRegister(
                                        email: emailcontroller.text.toString(),
                                        password:
                                            passwordcontroller.text.toString(),
                                        name: namecontroller.text.toString(),
                                        phone: numbercontroller.text.toString(),
                                      );
                                    }
                                  },
                                  decoration: InputDecoration(
                                    label: const Text(
                                      'Name',
                                    ),
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    // hintText: 'Name',
                                    hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: height1 / 50),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    prefixIcon: Icon(
                                      Icons.person_outline,
                                      color: Colors.white,
                                      size: height1 / 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 3,
                              child: Form(
                                key: numberglobalKey,
                                child: TextFormField(
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return "You must enter your number";
                                  //   } else if (value.length != 11) {
                                  //     return "You should enter a valid number";
                                  //   }
                                  // },
                                  style: const TextStyle(color: Colors.white),
                                  controller: numbercontroller,
                                  onFieldSubmitted: (value) {
                                    if (emailglobalKey.currentState!
                                            .validate() &&
                                        passwordglobalKey.currentState!
                                            .validate() &&
                                        nameglobalKey.currentState!
                                            .validate() &&
                                        numberglobalKey.currentState!
                                            .validate()) {
                                      controller.getRegister(
                                        email: emailcontroller.text,
                                        password: passwordcontroller.text,
                                        name: namecontroller.text,
                                        phone: numbercontroller.text,
                                      );
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      prefixIcon: Icon(
                                        Icons.numbers,
                                        color: Colors.white,
                                        size: height1 / 40,
                                      ),
                                      label: Text(
                                        'Number',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height1 / 50),
                                      )),
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 3,
                              child: Form(
                                key: emailglobalKey,
                                child: TextFormField(
                                  validator: (value) {
                                    // if (value == null || value.isEmpty) {
                                    //   return "You must enter an email";
                                    // } else if (!value.contains('@gmail.com')) {
                                    //   return "Email must contain @gmail.com";
                                    // } else if (value.length <=
                                    //     "@gmail.com".length) {
                                    //   return "You should enter a valid email";
                                    // }
                                  },
                                  style: const TextStyle(color: Colors.white),
                                  controller: emailcontroller,
                                  onFieldSubmitted: (value) {
                                    if (emailglobalKey.currentState!
                                            .validate() &&
                                        passwordglobalKey.currentState!
                                            .validate() &&
                                        nameglobalKey.currentState!
                                            .validate() &&
                                        numberglobalKey.currentState!
                                            .validate()) {
                                      controller.getRegister(
                                        email: emailcontroller.text.toString(),
                                        password:
                                            passwordcontroller.text.toString(),
                                        name: namecontroller.text.toString(),
                                        phone: numbercontroller.text.toString(),
                                      );
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.white,
                                        size: height1 / 40,
                                      ),
                                      label: Text(
                                        'Email',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height1 / 50),
                                      )),
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 3,
                              child: Form(
                                key: passwordglobalKey,
                                child: TextFormField(
                                  obscureText: controller.hidePassword,
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Password can not be empty';
                                  //   } else if (value !=
                                  //       passwordcontroller.text) {
                                  //     return "Password doesn't match";
                                  //   }
                                  // },
                                  style: const TextStyle(color: Colors.white),
                                  controller: passwordcontroller,
                                  onFieldSubmitted: (value) {
                                    if (emailglobalKey.currentState!
                                            .validate() &&
                                        passwordglobalKey.currentState!
                                            .validate() &&
                                        nameglobalKey.currentState!
                                            .validate() &&
                                        numberglobalKey.currentState!
                                            .validate()) {
                                      controller.getRegister(
                                        email: emailcontroller.text.toString(),
                                        password:
                                            passwordcontroller.text.toString(),
                                        name: namecontroller.text.toString(),
                                        phone: numbercontroller.text.toString(),
                                      );
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      prefixIcon: Icon(
                                        Icons.password,
                                        color: Colors.white,
                                        size: height1 / 40,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: controller.hidePassword
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility),
                                        onPressed: () {
                                          controller.getpassword();
                                        },
                                      ),
                                      label: Text(
                                        'Password',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height1 / 50),
                                      )),
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Already have an account',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: height1 / 60),
                                  ),
                                ),
                              ),
                            ),
                            // const Spacer(
                            //   flex: 1,
                            // ),
                            // Expanded(
                            //     flex: 2,
                            //     child: TextButton(
                            //       child: Text('Pick Image'),
                            //       onPressed: () {
                            //         showDialog(
                            //           context: context,
                            //           builder: (_) => AlertDialog(
                            //             title: const Text(
                            //               'Pick Image',
                            //               textAlign: TextAlign.center,
                            //             ),
                            //             content: Row(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.spaceAround,
                            //               children: [
                            //                 TextButton(
                            //                   onPressed: () {
                            //                     controller.getImageCamera()
                            //                         as File?;
                            //                   },
                            //                   child: const Text('Camera'),
                            //                 ),
                            //                 const SizedBox(
                            //                   width: 10,
                            //                 ),
                            //                 TextButton(
                            //                   onPressed: () {
                            //                     controller.getImageGallery()
                            //                         as File?;
                            //                   },
                            //                   child: const Text('Gallary'),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         );
                            //       },
                            //     )),
                            const Spacer(
                              flex: 3,
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                width: 200,
                                padding: EdgeInsets.all(height1 / 140),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green.withOpacity(.15),
                                ),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    print("1");
                                    if (emailglobalKey.currentState!
                                            .validate() &&
                                        passwordglobalKey.currentState!
                                            .validate() &&
                                        nameglobalKey.currentState!
                                            .validate() &&
                                        numberglobalKey.currentState!
                                            .validate()) {
                                      controller.getRegister(
                                        email: emailcontroller.text.toString(),
                                        password:
                                            passwordcontroller.text.toString(),
                                        name: namecontroller.text.toString(),
                                        phone: numbercontroller.text.toString(),
                                      );
                                    }
                                    print("2");
                                  },
                                  child: Text(
                                    'Sing_In',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: height1 / 40),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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

import 'package:flutter/material.dart';
import 'package:flutter_application_3/controller/cubit/login_cubit.dart';
import 'package:flutter_application_3/view/Register_screen.dart';
import 'package:flutter_application_3/view/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../controller/states/login_register_states.dart';
import '../core/sharedPre.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> emailGlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height;
    return BlocConsumer<LoginRegisterCubit, LoginRedisterStates>(
      listener: (context, state) {
        if (state is LoginSuccessStates) {
          if (state.model.status!) {
            Fluttertoast.showToast(msg: state.model.message!);
            HelperSharedPreference.setString(key: 'stapes', value: '2');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          } else if (state is LoginErrorStates) {
            Fluttertoast.showToast(msg: state.model.message!);
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
                        padding: EdgeInsets.fromLTRB(height1 / 70, height1 / 10,
                            height1 / 70, height1 / 50),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height1 / 20),
                              ),
                            ),
                            const Spacer(flex: 2),
                            Expanded(
                              flex: 2,
                              child: Form(
                                key: emailGlobalKey,
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: emailController,
                                  onFieldSubmitted: (value) {
                                    _submitForm(controller);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.white,
                                      size: height1 / 40,
                                    ),
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: height1 / 50,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 2,
                              child: Form(
                                key: passwordGlobalKey,
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: passwordController,
                                  onFieldSubmitted: (value) {
                                    _submitForm(controller);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                      size: height1 / 40,
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: height1 / 50,
                                    ),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Forgotten password!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: height1 / 60,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Register(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Create a new Account',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: height1 / 60,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(flex: 5),
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 200,
                                padding: EdgeInsets.all(height1 / 140),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green.withOpacity(.15),
                                ),
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: () {
                                    _submitForm(controller);
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: height1 / 40,
                                    ),
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
              )
            ],
          ),
        );
      },
    );
  }

  void _submitForm(LoginRegisterCubit controller) {
    if (emailGlobalKey.currentState!.validate() &&
        passwordGlobalKey.currentState!.validate()) {
      controller.getLogin(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      );
    }
  }
}

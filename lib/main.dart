import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/controller/cubit/home_cubit.dart';
import 'package:flutter_application_3/controller/cubit/login_cubit.dart';
import 'package:flutter_application_3/controller/cubit/register_cubit.dart';
import 'package:flutter_application_3/core/helperdio.dart';
import 'package:flutter_application_3/core/sharedPre.dart';
import 'package:flutter_application_3/view/Register_screen.dart';
import 'package:flutter_application_3/view/home_screen.dart';
import 'package:flutter_application_3/view/login_screen.dart';
import 'package:flutter_application_3/view/main_screen.dart';
import 'package:flutter_application_3/view/page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelpr.Init();
  HelperSharedPreference.Init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => LoginRegisterCubit()),
          BlocProvider(
              create: (BuildContext context) => HomeCubit()..getHomeData()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarBrightness: Brightness.light,
                      statusBarColor: Colors.white)),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: HelperSharedPreference.getString(key: 'stapes') == ' 1'
                ? Register() //number
                : HelperSharedPreference.getString(key: 'stapes') == '2'
                    ? MainScreen()
                    : PageScreen() //0

            ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/model1.dart';
import 'package:flutter_application_3/view/Register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/cubit/register_cubit.dart';
import '../core/sharedPre.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Name',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text("${HelperSharedPreference.getString(key: 'name')}"),
            SizedBox(
              height: 20,
            ),
            Text(
              'Phone',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text("${HelperSharedPreference.getString(key: 'phone')}"),
            SizedBox(
              height: 20,
            ),
            Text(
              'Email',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text("${HelperSharedPreference.getString(key: 'email')}"),
          ],
        ),
      ),
    );
  }
}

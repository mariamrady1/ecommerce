import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/model1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/cubit/home_cubit.dart';
import '../controller/states/home_states.dart';
import '../core/sharedPre.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProfileSuccessState) {
          var date = HomeCubit.get(context).ProfileModel.data;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('${date!.name}'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Phone',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('${date?.phone}'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('${date?.email}'),
              ],
            ),
          );
        } else if (state is HomeNoInternetState) {
          return const Center(
            child: Text("NO internet"),
          );
        } else {
          return Center(child: const CircularProgressIndicator());
        }
      },
    );
  }
}

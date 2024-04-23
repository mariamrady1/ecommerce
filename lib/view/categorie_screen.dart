import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/modelcategories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/cubit/home_cubit.dart';
import '../controller/states/home_states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return  BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          ModelDate? date = HomeCubit.get(context).categoriesDate.data;
          return SafeArea(
            child: Padding(
              padding:  EdgeInsets.only(bottom: 30),
              child: GridView.builder(

                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1 / 1.1),
                  itemCount: date!.listDate.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    "${date.listDate[index].image?? "https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png"}",
                                    height: height / 6,
                                  ),
                                ),
                              ),


                            ]),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Text('${date.listDate[index].name}'),

                          ),
                        )
                      ],
                    );
                  }),
            ),
          );
        } else {
          return Center(child: const CircularProgressIndicator());
        }
      },
    );
  }
}

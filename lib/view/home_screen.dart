import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/controller/cubit/home_cubit.dart';
import 'package:flutter_application_3/controller/states/home_states.dart';
import 'package:flutter_application_3/model/model.dart';
import 'package:flutter_application_3/view/home2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeSuccessState) {
          List date = HomeCubit.get(context).homeModel.itemData!.products;
          return SingleChildScrollView(
            child: SizedBox(
              height: height * (date.length / 5.665),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    //margin: const EdgeInsets.only(bottom: 5),
                    width: width,
                    child: Container(
                      width: width,
                      margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black54,
                            width: 2,
                          ),
                          right: BorderSide(
                            color: Colors.black54,
                            width: 2,
                          ),
                          left: BorderSide(
                            color: Colors.black54,
                            width: 2,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: CarouselSlider(
                          items: date
                              .map((e) => CachedNetworkImage(
                                        imageUrl:
                                            "${e.image ?? "https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png"}",
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.error_outline_sharp,
                                          color: Colors.red,
                                        ),
                                        placeholder: (context, url) {
                                          return Shimmer.fromColors(
                                            baseColor: Colors.grey.shade200,
                                            highlightColor:
                                                Colors.grey.shade500,
                                            child: Container(
                                              color: Colors.grey,
                                              height: 100,
                                              width: 200,
                                            ),
                                          );
                                        },
                                        height: 150,
                                      )
                                  // Image(
                                  //       image: NetworkImage(
                                  //           "${e.image ?? "https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png"}"),
                                  //       fit: BoxFit.fill,
                                  //       height: height / 5,
                                  //     )
                                  )
                              .toList(),
                          options: CarouselOptions(
                            height: height / 4.5,
                            viewportFraction: 1,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 4),
                            autoPlayAnimationDuration:
                                const Duration(seconds: 2),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,
                          )),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 1 / 1.45),
                        itemCount: date.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Home(model: date[index])),
                              );
                            },
                            child: Stack(
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
                                          child:
                                              // Image.network(
                                              //   "${date[index].image ?? "https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png"}",
                                              //   height: height / 6,
                                              // ),

                                              CachedNetworkImage(
                                            imageUrl:
                                                "${date[index].image ?? "https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png"}",
                                            placeholder: (context, url) {
                                              //Shimmer.fromColors
                                              return Shimmer.fromColors(
                                                baseColor: Colors.grey.shade200,
                                                highlightColor:
                                                    Colors.grey.shade500,
                                                child: Container(
                                                  color: Colors.grey,
                                                  height: 100,
                                                  width: 200,
                                                ),
                                              );
                                              height:
                                              150;
                                            },
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(
                                              Icons.error_outline_sharp,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          "${date[index].name}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: height / 50,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Text(
                                                "\$",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: height / 50),
                                              ),
                                            ),
                                            Text(
                                              "${date[index].price}",
                                              style: TextStyle(
                                                  fontSize: height / 50,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(2),
                                    child: date[index].discount != 0
                                        ? Text(
                                            "Discount",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.red),
                                          )
                                        : SizedBox.shrink(),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
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

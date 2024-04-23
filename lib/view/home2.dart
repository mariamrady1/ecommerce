import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:duration/duration.dart';
import 'package:shimmer/shimmer.dart';

import '../model/model.dart';

class Home extends StatelessWidget {
  const Home({required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    // List<Widget> images = [
    //   Image.asset('images/IMG_20240225_201411_887.jpg'),
    //   Image.asset('images/IMG_20240225_201411_175.jpg'),
    //   Image.asset('images/IMG_20240225_201411_424.jpg'),
    //   Image.asset('images/IMG_20240225_201411_714.jpg'),
    // ];
    int currentindex = 0;
    Color b = Colors.black;
    Color w = Colors.white;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const [Icon(Icons.heart_broken_outlined)],
          leading: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 10,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return CachedNetworkImage(
                        height: 150,
                        imageUrl:
                            "${model.images![index] ?? "https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png"}",
                        placeholder: (context, url) => Shimmer.fromColors(
                          child: Container(
                            color: Colors.grey,
                            height: 100,
                            width: 200,
                          ),
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error_outline_sharp,
                          color: Colors.red,
                        ),
                      );
                      // Image.network(
                      //   "${model.images![index] ?? "https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png"}",
                      //   height: height / 5,
                      //   width: width / 2,
                      // );
                    },
                    duration: 1,
                    //duration: Duration(seconds: 100),
                    itemCount: model.images!.length,
                    pagination: SwiperPagination(),
                    control: SwiperControl(),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: width / 2,
                        child: Text(
                          '${model.name} ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('${model.price}'),
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 2,
                  child: const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      Text(
                        '4.5(15 Review) ',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Details ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    '${model.description}',
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                    maxLines: 3,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  child: Text(
                    'Color ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: 75,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              right: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              left: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              top: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              width: 70,
                              height: 70,
                              color: Colors.black,
                            ),
                          )),
                      Container(
                          width: 75,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              right: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              left: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              top: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              width: 70,
                              height: 70,
                              color: Colors.brown,
                            ),
                          )),
                      Container(
                          width: 75,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              right: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              left: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              top: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              width: 70,
                              height: 70,
                              color: Colors.blueGrey,
                            ),
                          )),
                      Container(
                          width: 75,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              right: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              left: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              top: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              width: 70,
                              height: 70,
                              color: Colors.deepOrangeAccent,
                            ),
                          )),
                    ],
                  ),
                ),
                Text(
                  'size ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 165,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'CHOOSE SIZE',
                        suffixIcon: Icon(Icons.arrow_back),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.orange,
                      ),
                      width: 500,
                      child: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            'Buy Now',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}






//   import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../model/model.dart';
// class Home extends StatelessWidget {
//   const Home({required this.model});
//  final ProductModel model;
//
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.sizeOf(context).height;
//     double width = MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       //backgroundColor: Colors.grey,
//       appBar: AppBar(
//         title: Text("${model.name}"),
//       ),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: height * (model.images!.length/5),
//           child: Padding(
//             padding: const EdgeInsets.all(2),
//             child: Column(
//               children: [
//                 // Text('ggg'),
//               //   Expanded(
//               //     flex: 4,
//               //   child: Container(
//               //     height: 200,
//               //       width:width ,
////                    child:Image.network( "${model.image?? "https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png"}"),
//               //       ),
//               // ),
//                 Row(
//                   children: [
//                     model.discount !=0?
//                     Row(
//                       children: [
//                         Text('oldPrice',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,)),
//                         Text('${model.oldPrice}',style: TextStyle(decoration: TextDecoration.lineThrough)),
//                       ],
//                     ):SizedBox.shrink(),
//
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text('Price',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
//                     Text('${model.price}'),
//                   ],
//                 ),
//                 Text('Description',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold,),),
//                 Text("${model.description}",overflow: TextOverflow.ellipsis,maxLines: 4,),
//                 Expanded(
//
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: Container(
//                       color: Colors.grey,
//                       child: GridView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                               maxCrossAxisExtent: 200,
//                               childAspectRatio: 3 / 2,
//                               crossAxisSpacing: 20,
//                               mainAxisSpacing: 20),
//                           itemCount: model.images!.length,
//                           itemBuilder: (BuildContext ctx, index) {
//                             return Padding(
//                               padding: const EdgeInsets.only(top: 10,bottom: 10),
//                               child: Container(
//                                 height: 50,
//                                 //height: model.images!.length,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(15)),
//                                 child: Image.network('${model.images![index]?? "https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png"}',height: height / 6,)),
//                             );
//                           }),
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

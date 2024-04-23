import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/internet_connect.dart';
import 'package:flutter_application_3/core/sharedPre.dart';
import 'package:flutter_application_3/model/modelcategories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helperdio.dart';
import '../../model/model.dart';
import '../../model/model1.dart';
import '../../view/categorie_screen.dart';
import '../../view/favorite_screen.dart';
import '../../view/home_screen.dart';
import '../../view/page.dart';
import '../../view/prof_screen.dart';
import '../states/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const Favorite(),
    ProfileScreen()
  ];

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.category_outlined,
    Icons.person_rounded,
    Icons.settings,
  ];

  List<String> listOfStrings = [
    'Home',
    'Category',
    'Favorite',
    'Setting',
  ];

  int currentIndex = 0;
  int indexpage = 0;
  void getPage(int page) {
    indexpage = page;
    emit(PageState());
  }

  void changeBottomNav(int index) {
    print(currentIndex);
    currentIndex = index;
    if (currentIndex == 0) {
      getHomeData();
    } else if (currentIndex == 1) {
      getCategories();
    } else if (currentIndex == 2) {
      getProfile();
    }
    emit(BottomNavState());
  }

  late ItemsModel homeModel;
  late CategoriesDate categoriesDate;
  void getHomeData() async {
    if (await interConnect()) {
      emit(HomeLoadingState());
      DioHelpr.getDate(url: 'home', lang: "en").then((value) {
        homeModel = ItemsModel.fromJson(value.data);

        emit(HomeSuccessState());
      }).catchError((error) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(HomeErrorState(error.toString()));
      });
    } else {
      emit(HomeNoInternetState());
    }
  }

  void getCategories() async {
    if (await interConnect()) {
      emit(CategoriesLoadingState());
      DioHelpr.getDate(url: 'categories', lang: "en").then((value) {
        categoriesDate = CategoriesDate.fromJson(value.data);

        print(categoriesDate.data!.listDate[0].id);
        emit(CategoriesSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(CategoriesErrorState(error.toString()));
      });
    } else {
      emit(HomeNoInternetState());
    }
  }

  late DateMdel1 ProfileModel;
  void getProfile() async {
    if (await interConnect()) {
      print(HelperSharedPreference.getString(key: 'token'));
      emit(ProfileLoadingState());
      print('Loading');
      DioHelpr.getDate(
              url: 'profile',
              lang: "en",
              token: HelperSharedPreference.getString(key: 'token'))
          .then((value) {
        print(value.data);
        ProfileModel = DateMdel1.fromMap(value.data);
        print(ProfileModel.data!.email);
        //print(categoriesDate.data!.listDate[0].id);
        emit(ProfileSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ProfileErrorState(error.toString()));
      });
    } else {
      emit(HomeNoInternetState());
    }
  }

  int nextpadecurrent = 0;
  void getNextPage(int index) {
    nextpadecurrent = index;
    emit(NextPagetState());
  }

  PageController pageController = PageController();
  List<PageWidget> Pages = [
    PageWidget(
      image: Image.asset(
        'assets/images/IMG_20240225_201411_175.jpg',
      ),
      title: 'Enjoy free shipping on all orders',
      subtitle: 'Hot discounts',
    ),
    PageWidget(
      image: Image.asset(
        'assets/images/IMG_20240225_201411_424.jpg',
      ),
      title: 'Enjoy free shipping on all orders',
      subtitle: 'Hot discounts',
    ),
    PageWidget(
      image: Image.asset(
        'assets/images/IMG_20240225_201411_714.jpg',
      ),
      title: 'Enjoy free shipping on all orders',
      subtitle: 'Hot discounts',
    ),
    PageWidget(
      image: Image.asset(
        'assets/images/IMG_20240225_201411_887.jpg',
      ),
      title: 'Enjoy free shipping on all orders',
      subtitle: 'Hot discounts',
    ),
  ];
}

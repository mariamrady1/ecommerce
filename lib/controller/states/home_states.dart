abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeErrorState extends HomeStates {
  final String error;
  HomeErrorState(this.error);
}

class BottomNavState extends HomeStates {}

class CategoriesLoadingState extends HomeStates {}

class CategoriesSuccessState extends HomeStates {}

class CategoriesErrorState extends HomeStates {
  final String error;
  CategoriesErrorState(this.error);
}

class ProfileLoadingState extends HomeStates {}

class ProfileSuccessState extends HomeStates {}

class ProfileErrorState extends HomeStates {
  final String error;
  ProfileErrorState(this.error);
}

class PageState extends HomeStates {}

class HomeNoInternetState extends HomeStates {}

class NextPagetState extends HomeStates {}

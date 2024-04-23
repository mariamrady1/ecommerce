import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/controller/states/login_register_states.dart';
import 'package:flutter_application_3/core/helperdio.dart';
import 'package:flutter_application_3/core/internet_connect.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/sharedPre.dart';
import '../../model/model1.dart';
import 'package:image_picker/image_picker.dart';

class LoginRegisterCubit extends Cubit<LoginRedisterStates> {
  LoginRegisterCubit() : super(LoginRegisterInitStates());

  static LoginRegisterCubit get(context) => BlocProvider.of(context);

  void getLogin({required String email, required String password}) async {
    if (await interConnect()) {
      emit(LoginLoadingStates());
      DioHelpr.postDate(
          url: 'login',
          date: {'email': email, 'password': password}).then((value) {
        DateMdel1 model = DateMdel1.fromMap(value.data);
        HelperSharedPreference.setString(
            key: 'email', value: model.data!.email ?? '');
        HelperSharedPreference.setString(
            key: 'token', value: model.data!.token ?? '');
        HelperSharedPreference.setString(
            key: 'name', value: model.data!.name ?? '');
        emit(LoginSuccessStates(model));
      }).catchError((error) {
        emit(LoginErrorStates(error.toString()));
      });
    } else {
      emit(NoInternetStates());
    }
  }

  late DateMdel1 mdel1;
  void getRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    if (await interConnect()) {
      emit(RegisterLoadingStates());
      DioHelpr.postDate(url: 'register', date: {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password
      }).then((value) {
        print(value.data);
        mdel1 = DateMdel1.fromMap(value.data);
        HelperSharedPreference.setString(
            key: 'name', value: mdel1.data!.name ?? '');
        HelperSharedPreference.setString(
            key: 'phone', value: mdel1.data!.phone ?? '');
        HelperSharedPreference.setString(
            key: 'email', value: mdel1.data!.email ?? '');
        HelperSharedPreference.setString(
            key: 'token', value: mdel1.data!.token ?? '');
        // HelperSharedPreference.setString(
        //     key: 'image', value: getImageGallery'');
        emit(RegisterSuccessStates(mdel1));
      }).catchError((error) {
        emit(RegisterErrorStates(error.toString()));
      });
    } else {
      emit(NoInternetStates());
    }
  }

  bool hidePassword = true;
  void getpassword() {
    hidePassword = !hidePassword;
    emit(RegisterIconStates());
  }
  // pickImage(bool isCamera) async {
  //   _image = await picker.pickImage(source:isCamera? ImageSource.camera : ImageSource.gallery);
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     content: Text('Image picked successfully'),
  //     backgroundColor: Colors.green,
  //   ));
  // }

  bool hasImage = false;
//File file;

  Future getImageGallery(bool isCamera) async {
    final image = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    //file=  File(image!.path);

    emit(pickImageGalleryStates());
  }

// Future getImageCamera() async {
//   try {
//     final image = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (image == null) return;
//     final imageTemporary = File(image.path);
//
//     this.fileimage = imageTemporary;
//     hasImage = true;
//   } on PlatformException catch (e) {
//     debugPrint('Failed to pick image: $e');
//   }
//   emit(pickImagecameraStates());
// }
}

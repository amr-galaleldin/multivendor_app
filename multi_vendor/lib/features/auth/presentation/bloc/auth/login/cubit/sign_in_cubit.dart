import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:ecommerceapp/config/routing/app_routes_info/app_routes_name.dart';
import 'package:ecommerceapp/features/auth/domain/entites/user_entity.dart';

import '../../../../../../../core/errors/network_exceptions.dart';
import '../../../../../domain/usecases/signin_use_cases.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {

  final SignInUseCase signInUseCase;
  SignInCubit(
    this.signInUseCase,
  ) : super(const SignInState.idle());

  static GlobalKey<FormState> formstate = GlobalKey<FormState>();
  static TextEditingController email = TextEditingController();
  static TextEditingController password = TextEditingController();

  loginEvent(UserEntity user) async {
    if (formstate.currentState!.validate()) {

        emit(const SignInState.loading());
         Future.delayed(const Duration(seconds: 2));
      final dataState = await signInUseCase(user);

      dataState.when(success: (msg) {
        emit(SignInState.success(msg));
         clearTextInTextField();
        Future.delayed(const Duration(seconds: 1));
        Get.offNamed(AppRouteName.home);
      }, failure: (exception) {
        emit(SignInState.errors(NetworkExceptions.getErrorMessage(exception)));
      });
    
    }
  }

  goToSignUpEvent() {
    clearTextInTextField();
    Get.offNamed(AppRouteName.signUp);
  }

  goToForgetPasswordEvent() {
    clearTextInTextField();
    Get.offNamed(AppRouteName.forgetPassword);
  }

  void clearTextInTextField() {
    email.text = "";

    password.text == "";
  }
}

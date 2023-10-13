
import 'package:ecommerceapp/config/routing/app_routes_info/app_routes_name.dart';
import 'package:ecommerceapp/features/auth/domain/usecases/signup_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../../../../core/errors/network_exceptions.dart';
import '../../../../../domain/entites/user_entity.dart';
import '../../verfiycode/cubit/verifycode_cubit.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpUseCase signUpUseCase;

  SignupCubit( this.signUpUseCase) : super(const SignupState.idle());

  static GlobalKey<FormState> formstate = GlobalKey<FormState>();
  static TextEditingController username = TextEditingController();
  static TextEditingController phone = TextEditingController();
  static TextEditingController email = TextEditingController();
  static TextEditingController password = TextEditingController();

  signUpEvent(UserEntity user) async {
    if (formstate.currentState!.validate()) {
    

      emit(const SignupState.loading());
       Future.delayed(const Duration(seconds: 2));
      final dataState = await signUpUseCase(user);

      dataState.when(success: (msg) {
        emit(SignupState.success(msg));
          VerifyCodeCubit.signUpOrForgetPage = "signup";
        VerifyCodeCubit.verfiyEmail = email.text;
         clearTextInTextField();
        Future.delayed(const Duration(seconds: 1));
        Get.offNamed(AppRouteName.verifyCode);
      }, failure: (exception) {
        emit(SignupState.errors(NetworkExceptions.getErrorMessage(exception)));
      });
    }
  }

  goTologinEvent() {
    clearTextInTextField();
    Get.offNamed(AppRouteName.login);
  }

  void clearTextInTextField() {
    username.text = "";
    email.text = "";
    phone.text = "";
    password.text = "";
  }
}

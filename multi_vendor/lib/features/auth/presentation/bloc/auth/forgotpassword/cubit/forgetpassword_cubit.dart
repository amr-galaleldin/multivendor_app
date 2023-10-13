import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:ecommerceapp/config/routing/app_routes_info/app_routes_name.dart';

import '../../../../../../../core/errors/network_exceptions.dart';
import '../../../../../domain/entites/user_entity.dart';
import '../../../../../domain/usecases/forget_password_use_cases.dart';
import '../../verfiycode/cubit/verifycode_cubit.dart';
import 'forgetpassword_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
 final ForgrtPasswordUseCase forgrtPasswordUseCase;
  ForgetPasswordCubit(
    this.forgrtPasswordUseCase,
  ) : super(const ForgetPasswordState.idle());

  static GlobalKey<FormState> formstate = GlobalKey<FormState>();
  static TextEditingController email = TextEditingController();

  entryEmail(UserEntity user) async{
    if (formstate.currentState!.validate()){
    
        emit(const ForgetPasswordState.loading());
           Future.delayed(const Duration(seconds: 2));

      final dataState = await forgrtPasswordUseCase(user);

      dataState.when(success:(success){
   emit(ForgetPasswordState.success(success));
  VerifyCodeCubit.signUpOrForgetPage = "forget";
        
       VerifyCodeCubit.verfiyEmail = email.text;
         clearTextInTextField();
         Future.delayed(const Duration(seconds: 1));
       Get.offNamed(AppRouteName.verifyCode);
      } , failure:(failure){

        emit(ForgetPasswordState.errors(NetworkExceptions.getErrorMessage(failure)));
      } );

      

    }
  }

  void clearTextInTextField() {
    email.text = "";
  }
}

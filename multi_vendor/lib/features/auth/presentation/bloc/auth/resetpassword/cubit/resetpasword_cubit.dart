import 'package:ecommerceapp/features/auth/domain/entites/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:ecommerceapp/config/routing/app_routes_info/app_routes_name.dart';

import '../../../../../../../core/errors/network_exceptions.dart';
import '../../../../../domain/usecases/reset_password_use_cases.dart';
import '../../successproccess/cubit/success_cubit.dart';
import './resetpassword_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;
  ResetPasswordCubit(
    this.resetPasswordUseCase,
  ) : super(const ResetPasswordState.idle());

  static String? resetEmail;

  static GlobalKey<FormState> formstate = GlobalKey<FormState>();
  static TextEditingController password = TextEditingController();
  static TextEditingController rePassword = TextEditingController();

  resetPassword(UserEntity user) async {
    if (formstate.currentState!.validate()) {
      if (password.text == rePassword.text) {
       

        emit(const ResetPasswordState.loading());
         Future.delayed(const Duration(seconds: 2));
        final dataState = await resetPasswordUseCase(user);

        dataState.when(success: (success) {
          emit(ResetPasswordState.success(success));
           SuccessCubit.resetOrVerfiyCodePage = "reset";

          clearTextInTextField();
          Future.delayed(const Duration(seconds: 1));

          Get.offNamed(AppRouteName.success);
        }, failure: (failure) {
          emit(ResetPasswordState.errors(
              NetworkExceptions.getErrorMessage(failure)));
        });
      } else {
        emit(const ResetPasswordState.errors("re-inter password correctly"));
      }
    }
  }

  void clearTextInTextField() {
    rePassword.text == "";
    password.text = "";
  }
}

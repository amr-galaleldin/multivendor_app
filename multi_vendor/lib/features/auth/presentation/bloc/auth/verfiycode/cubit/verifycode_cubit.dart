import 'package:ecommerceapp/config/routing/app_routes_info/app_routes_name.dart';
import 'package:ecommerceapp/features/auth/presentation/bloc/auth/verfiycode/cubit/verifycode_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../../../core/errors/network_exceptions.dart';
import '../../../../../domain/entites/user_entity.dart';
import '../../../../../domain/usecases/forgetpass_verification_use_cases.dart';
import '../../../../../domain/usecases/signup_verification_use_cases.dart';
import '../../resetpassword/cubit/resetpasword_cubit.dart';
import '../../successproccess/cubit/success_cubit.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final ForgrtPasswordVerificationUseCase forgrtPasswordVerificationUseCase;
  final SignUpVerifyUseCase signUpVerifyUseCase;
  VerifyCodeCubit(
    this.forgrtPasswordVerificationUseCase,
    this.signUpVerifyUseCase,
  ) : super(const VerifyCodeState.idle());

  static String? signUpOrForgetPage;

 static  String? verfiyEmail;

  checkCode( UserEntity user) async {
    

    if (signUpOrForgetPage == "forget") {
      emit(const VerifyCodeState.loading());
       Future.delayed(const Duration(seconds: 2));
      final forgetVerify = await forgrtPasswordVerificationUseCase( user);

      forgetVerify.when(success: (success) {
        emit(VerifyCodeState.success(success));
        
        ResetPasswordCubit.resetEmail=verfiyEmail;
        SuccessCubit.resetOrVerfiyCodePage = "verfiy";
        Future.delayed(const Duration(seconds: 1));
        Get.offNamed(AppRouteName.resetPassword);
      }, failure: (failure) {
        emit(
            VerifyCodeState.errors(NetworkExceptions.getErrorMessage(failure)));
      });
    } else {
      emit(const VerifyCodeState.loading());
      final signUpVerify = await signUpVerifyUseCase( user);

      signUpVerify.when(success: (success) {
        emit(VerifyCodeState.success(success));
        Future.delayed(const Duration(seconds: 1));
        Get.offNamed(AppRouteName.success);
      }, failure: (failure) {
        emit(
            VerifyCodeState.errors(NetworkExceptions.getErrorMessage(failure)));
      });
    }
  }
}

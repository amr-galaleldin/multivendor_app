import 'package:freezed_annotation/freezed_annotation.dart';
part 'forgetpassword_state.freezed.dart';


@freezed
  class ForgetPasswordState  with _$ForgetPasswordState {
   const factory ForgetPasswordState.idle() = Idle;

  const factory ForgetPasswordState.loading() = Loading;

  const factory ForgetPasswordState.success(String successMsg) = Success;

  const factory ForgetPasswordState.errors(String failureMsg) = Errors;
 }


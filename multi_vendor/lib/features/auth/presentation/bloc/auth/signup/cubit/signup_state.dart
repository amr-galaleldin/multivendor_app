import 'package:freezed_annotation/freezed_annotation.dart';
 part 'signup_state.freezed.dart';


@freezed
  class SignupState  with _$SignupState {
   const factory SignupState.idle() = Idle;

  const factory SignupState.loading() = Loading;

  const factory SignupState.success(String successMsg) = Success;

  const factory SignupState.errors(String failureMsg) = Errors;
 }


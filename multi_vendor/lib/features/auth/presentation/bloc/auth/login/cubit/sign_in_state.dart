import 'package:freezed_annotation/freezed_annotation.dart';
 part 'sign_in_state.freezed.dart';


@freezed
  class SignInState  with _$SignInState {
   const factory SignInState.idle() = Idle;

  const factory SignInState.loading() = Loading;

  const factory SignInState.success(String successMsg) = Success;

  const factory SignInState.errors(String failureMsg) = Errors;
 }


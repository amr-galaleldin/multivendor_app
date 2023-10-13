
import 'package:freezed_annotation/freezed_annotation.dart';
 part 'verifycode_state.freezed.dart';


@freezed
  class VerifyCodeState  with _$VerifyCodeState {
   const factory VerifyCodeState.idle() = Idle;

  const factory VerifyCodeState.loading() = Loading;

  const factory VerifyCodeState.success(String successMsg) = Success;

  const factory VerifyCodeState.errors(String failureMsg) = Errors;
 }


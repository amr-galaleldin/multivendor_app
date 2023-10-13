
import 'package:freezed_annotation/freezed_annotation.dart';
part 'resetpassword_state.freezed.dart';


@freezed
  class ResetPasswordState  with _$ResetPasswordState {
   const factory ResetPasswordState.idle() = Idle;

  const factory ResetPasswordState.loading() = Loading;

  const factory ResetPasswordState.success(String successMsg) = Success;

  const factory ResetPasswordState.errors(String failureMsg) = Errors;
 }


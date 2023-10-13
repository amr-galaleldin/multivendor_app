
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordCubit extends Cubit<bool> {
  PasswordCubit() : super(false);

  showPassword() =>emit(!state);
  
 
  // @override
  // Future<void> close() {
  //   PasswordCubit().close();
  //   return super.close();
  // }
}

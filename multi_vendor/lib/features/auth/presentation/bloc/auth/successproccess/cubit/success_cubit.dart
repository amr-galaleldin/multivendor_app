import 'package:ecommerceapp/config/routing/app_routes_info/app_routes_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


part 'success_state.dart';

class SuccessCubit extends Cubit<SuccessState> {
  SuccessCubit() : super(LoadingState());

  static String? resetOrVerfiyCodePage;


  goToLogin( ) {
   Get.offAllNamed(AppRouteName.login);
   
  }

 
}

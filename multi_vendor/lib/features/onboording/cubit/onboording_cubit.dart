import 'package:ecommerceapp/config/routing/app_routes_info/app_route_path.dart';
import 'package:ecommerceapp/config/routing/app_routes_info/app_routes_name.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../injection_container.dart';
import '../data/datasource/static/static.dart';

class OnboordingCubit extends Cubit<int> {
  OnboordingCubit() : super(0);
  static PageController  onBoordingController=PageController();
  int?  index;

  onChangedEvent(int index){
  emit(index);
  } 

  nextEvent(BuildContext context ){

     index=state+1;

    if (index! > onBoardingList(context).length-1) {
      // Navigator.of(context).push(MaterialPageRoute(builder:(context)=> const Login()));
      sl<SharedPreferences>().setString("redirectLocation", AppRoutePath.login);
      Get.offNamed(AppRouteName.login);

    
     
    }else{
      emit(index!);
      onBoordingController.animateToPage(index!,curve: Curves.easeInOut,duration: const Duration(milliseconds: 500));
    }
    
    
    }


  skipEvent( ){
      
Get.offNamed(AppRouteName.login);

   Get.offNamed(AppRouteName.login);
 }
  // @override
  // Future<void> close() async {

  //   onBoordingController.dispose();
  //   OnboordingCubit().close();
  //   onBoordingController.dispose();

  //  return super.close();
  


  // }
}

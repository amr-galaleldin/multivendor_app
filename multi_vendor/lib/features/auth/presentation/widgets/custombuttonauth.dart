import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../bloc/auth/forgotpassword/cubit/forgetpassword_state.dart' as forgetpass;
import '../bloc/auth/login/cubit/sign_in_state.dart' as signin ;
import '../bloc/auth/resetpassword/cubit/resetpassword_state.dart' as resetpass;
import '../bloc/auth/signup/cubit/signup_state.dart' as signup;

class CustomButtomAuth extends StatelessWidget {
  final String text;

 final dynamic state;
  final void Function()? onPressed;
  const CustomButtomAuth({Key? key, required this.text, this.onPressed, this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    



    return Container(
      margin:const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding:const EdgeInsets.symmetric(vertical: 16),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child:_isLoading(state)? const Center(child:CircularProgressIndicator(color: Colors.white,),):Text(text , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 16)),
      ),
    );
  }
}



bool _isLoading(dynamic state){


 if ((state is signin.SignInState &&state is signin.Loading)||(state is signup.SignupState &&state is signup.Loading )||(state is resetpass.ResetPasswordState &&state is resetpass.Loading )||(state is forgetpass.ForgetPasswordState &&state is forgetpass.Loading )) {
   return true;
 } 
 return false;
}
import 'package:ecommerceapp/config/localization/loclizationconfig/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/utilits/functions/alertexitapp.dart';
import '../../../../core/utilits/functions/toast_message.dart';
import '../../../../core/utilits/functions/validinput.dart';
import '../../domain/entites/user_entity.dart';
import '../bloc/auth/passwordcubit/password_cubit.dart';
import '../bloc/auth/signup/cubit/signup_cubit.dart';
import '../bloc/auth/signup/cubit/signup_state.dart';
import '../widgets/custombuttonauth.dart';
import '../widgets/customtextbodyauth.dart';
import '../widgets/customtextformauth.dart';
import '../widgets/customtexttitleauth.dart';
import '../widgets/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(context),
        );
  }


  Widget _buildBody(BuildContext context) {
    return WillPopScope(
      onWillPop:()=>alertExitApp(context),
      child: BlocConsumer<SignupCubit,SignupState>(
        listener: (context, state) {
          state.whenOrNull(
           success: (successMsg) =>showToast(successMsg,const Color.fromARGB(255, 14, 85, 1)),
            errors: (failureMsg) => showToast(failureMsg,const Color.fromARGB(202, 135, 16, 0)),
        );},
        builder: (context,state)=>Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: SignupCubit.formstate,
              child: ListView(children: [
                const SizedBox(height: 20),
                CustomTextTitleAuth(text: AppLocalizations.of(context)!.auth2 ),
                const SizedBox(height: 10),
                CustomTextBodyAuth(text: AppLocalizations.of(context)!.auth16 ),
                const SizedBox(height: 15),
                CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 3, 20, "username",context);
                  },
    
                  hinttext:AppLocalizations.of(context)!.auth15 ,
                  iconData: Icons.person_outline,
                  labeltext: AppLocalizations.of(context)!.auth12,
                  textController: SignupCubit.username,
                  // mycontroller: ,
                ),
                CustomTextFormAuth(
                  keyboardType: TextInputType.emailAddress,
                  valid: (val) {
                    return validInput(val!, 3, 40, "email",context);
                  },
                  textController: SignupCubit.email,
                  hinttext: AppLocalizations.of(context)!.auth4 ,
                  iconData: Icons.email_outlined,
                  labeltext: AppLocalizations.of(context)!.auth10 ,
                ),
                CustomTextFormAuth(
                  keyboardType: TextInputType.phone,
                  valid: (val) {
                    return validInput(val!, 7, 11, "phone",context);
                  },
                  textController: SignupCubit.phone,
                  hinttext:  AppLocalizations.of(context)!.auth14,
                  iconData: Icons.phone_android_outlined,
                  labeltext:  AppLocalizations.of(context)!.auth13 ,
                ),
                BlocBuilder<PasswordCubit, bool>(builder: (context, state) {
                  return CustomTextFormAuth(
                    onTapIcon: () {
                      BlocProvider.of<PasswordCubit>(context).showPassword();
                    },
                    obscureText: state,
                    valid: (val) {
                      return validInput(val!, 3, 30, "password",context);
                    },
                    textController: SignupCubit.password,
                    hinttext: AppLocalizations.of(context)!.auth5 ,
                    iconData: state?Icons.visibility_off:Icons.visibility,
                    labeltext: AppLocalizations.of(context)!.auth11,
                    // mycontroller: ,
                  );
                }),
                CustomButtomAuth(
                  state: state,
                    text: AppLocalizations.of(context)!.auth9 ,
                    onPressed: () {
                      BlocProvider.of<SignupCubit>(context)
                          .signUpEvent(UserEntity(
                            email:SignupCubit.email.text,
                            password: SignupCubit.password.
                            text,phone: SignupCubit.phone.text
                          ,username: SignupCubit.username.text));
                    }),
                const SizedBox(height: 40),
                CustomTextSignUpOrSignIn(
                  textone:  AppLocalizations.of(context)!.auth17 ,
                  texttwo:  AppLocalizations.of(context)!.auth1 ,
                  onTap: () {
                    BlocProvider.of<SignupCubit>(context)
                        .goTologinEvent();
                  },
                ),
              ]),
            ),
          )
          
      ),
    );
  }
  

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColor.backgroundcolor,
      elevation: 0.0,
      title: Text( AppLocalizations.of(context)!.auth9 ,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey)),
    );
  }
}

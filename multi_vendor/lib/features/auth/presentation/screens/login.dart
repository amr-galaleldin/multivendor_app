import 'package:ecommerceapp/config/localization/loclizationconfig/app_localization.dart';

import 'package:ecommerceapp/features/auth/presentation/bloc/auth/passwordcubit/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/utilits/functions/alertexitapp.dart';
import '../../../../core/utilits/functions/toast_message.dart';
import '../../../../core/utilits/functions/validinput.dart';
import '../../domain/entites/user_entity.dart';
import '../bloc/auth/login/cubit/sign_in_cubit.dart';
import '../bloc/auth/login/cubit/sign_in_state.dart';
import '../widgets/custombuttonauth.dart';
import '../widgets/customtextbodyauth.dart';
import '../widgets/customtextformauth.dart';
import '../widgets/customtexttitleauth.dart';
import '../widgets/logoauth.dart';
import '../widgets/textsignup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return WillPopScope(
        onWillPop: () => alertExitApp(context),
        child: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {

              state.whenOrNull(
           success: (successMsg) =>showToast(successMsg,const Color.fromARGB(255, 14, 85, 1)),
            errors: (failureMsg) => showToast(failureMsg,const Color.fromARGB(202, 135, 16, 0)) );
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: SignInCubit.formstate,
                child: ListView(children: [
                  const LogoAuth(),
                  const SizedBox(height: 20),
                  CustomTextTitleAuth(
                      text: AppLocalizations.of(context)!.auth2),
                  const SizedBox(height: 10),
                  CustomTextBodyAuth(text: AppLocalizations.of(context)!.auth3),
                  const SizedBox(height: 15),
                  CustomTextFormAuth(
                    textController: SignInCubit.email,
                    keyboardType: TextInputType.emailAddress,
                    valid: (val) {
                      return validInput(val!, 5, 100, "email", context);
                    },
                    hinttext: AppLocalizations.of(context)!.auth4,
                    iconData: Icons.email_outlined,
                    labeltext: AppLocalizations.of(context)!.auth10,
                  ),
                  BlocBuilder<PasswordCubit, bool>(
                    builder: (context, state) {
                      return CustomTextFormAuth(
                        obscureText: state,
                        onTapIcon: () {
                          BlocProvider.of<PasswordCubit>(context)
                              .showPassword();
                        },
                        valid: (val) {
                          return validInput(val!, 5, 30, "password", context);
                        },
                        textController: SignInCubit.password,
                        hinttext: AppLocalizations.of(context)!.auth5,
                        iconData:
                            state ? Icons.visibility_off : Icons.visibility,
                        labeltext: AppLocalizations.of(context)!.auth11,
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<SignInCubit>(context)
                          .goToForgetPasswordEvent();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.auth6,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  CustomButtomAuth(
                    state: state,
                      text: AppLocalizations.of(context)!.auth1,
                      onPressed: () {
                        BlocProvider.of<SignInCubit>(context).loginEvent(UserEntity(
                          email:SignInCubit.email.text,
                          password: SignInCubit.password.text ));
                      }),
                  const SizedBox(height: 40),
                  CustomTextSignUpOrSignIn(
                    textone: AppLocalizations.of(context)!.auth8,
                    texttwo: AppLocalizations.of(context)!.auth9,
                    onTap: () {
                      BlocProvider.of<SignInCubit>(context).goToSignUpEvent();
                    },
                  )
                ]),
              ),
            );
          },
        ));
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColor.backgroundcolor,
      elevation: 0.0,
      title: Text(AppLocalizations.of(context)!.auth1,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey)),
    );
  }
}

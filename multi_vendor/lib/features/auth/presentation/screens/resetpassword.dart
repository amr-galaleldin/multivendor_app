import 'package:ecommerceapp/config/localization/loclizationconfig/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/utilits/functions/toast_message.dart';
import '../../../../core/utilits/functions/validinput.dart';
import '../../domain/entites/user_entity.dart';
import '../bloc/auth/passwordcubit/password_cubit.dart';
import '../bloc/auth/resetpassword/cubit/resetpassword_state.dart';
import '../bloc/auth/resetpassword/cubit/resetpasword_cubit.dart';
import '../widgets/custombuttonauth.dart';
import '../widgets/customtextbodyauth.dart';
import '../widgets/customtextformauth.dart';
import '../widgets/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
     state.whenOrNull(
           success: (successMsg) =>showToast(successMsg,const Color.fromARGB(255, 14, 85, 1)),
            errors: (failureMsg) => showToast(failureMsg,const Color.fromARGB(202, 135, 16, 0)) );
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: ResetPasswordCubit.formstate,
            child: ListView(children: [
              const SizedBox(height: 20),
              CustomTextTitleAuth(text: AppLocalizations.of(context)!.auth11),
              const SizedBox(height: 10),
              CustomTextBodyAuth(text: AppLocalizations.of(context)!.auth27),
              const SizedBox(height: 15),
              BlocBuilder<PasswordCubit, bool>(builder: (context, state) {
                return CustomTextFormAuth(
                  textController: ResetPasswordCubit.password,
                  obscureText: state,
                  onTapIcon: () {
                    BlocProvider.of<PasswordCubit>(context).showPassword();
                  },
                  valid: (val) {
                    return validInput(val!, 3, 40, "password", context);
                  },

                  hinttext: AppLocalizations.of(context)!.auth5,
                  iconData: state ? Icons.visibility_off : Icons.visibility,
                  labeltext: AppLocalizations.of(context)!.auth11,
                  // mycontroller: ,
                );
              }),
              BlocBuilder<PasswordCubit, bool>(builder: (context, state) {
                return CustomTextFormAuth(
                  textController: ResetPasswordCubit.rePassword,
                  obscureText: state,
                  onTapIcon: () {
                    BlocProvider.of<PasswordCubit>(context).showPassword();
                  },

                  valid: (val) {
                    return validInput(val!, 3, 40, "password", context);
                  },
                  hinttext: AppLocalizations.of(context)!.auth5,
                  iconData: state ? Icons.visibility_off : Icons.visibility,
                  labeltext:
                      "${AppLocalizations.of(context)!.confirm} ${AppLocalizations.of(context)!.auth11}",
                  // mycontroller: ,
                );
              }),
              CustomButtomAuth(
                state: state,
                  text: AppLocalizations.of(context)!.auth25,
                  onPressed: () {
                    BlocProvider.of<ResetPasswordCubit>(context)
                        .resetPassword(UserEntity (password: ResetPasswordCubit.rePassword.text ,email: ResetPasswordCubit.resetEmail));
                  }),
              const SizedBox(height: 40),
            ]),
          ),
        );
      },
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColor.backgroundcolor,
      elevation: 0.0,
      title: Text(AppLocalizations.of(context)!.auth36,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey)),
    );
  }
}

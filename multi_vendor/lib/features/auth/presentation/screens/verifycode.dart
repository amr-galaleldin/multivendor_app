import 'package:ecommerceapp/config/localization/loclizationconfig/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/utilits/functions/toast_message.dart';
import '../../domain/entites/user_entity.dart';
import '../bloc/auth/verfiycode/cubit/verifycode_cubit.dart';
import '../bloc/auth/verfiycode/cubit/verifycode_state.dart';
import '../widgets/customtextbodyauth.dart';
import '../widgets/customtexttitleauth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<VerifyCodeCubit,VerifyCodeState >(
      listener: (context, state) {

           state.whenOrNull(
           success: (successMsg) =>showToast(successMsg,const Color.fromARGB(255, 14, 85, 1)),
            errors: (failureMsg) => showToast(failureMsg,const Color.fromARGB(202, 135, 16, 0)) );
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: ListView(children: [
            const SizedBox(height: 20),
            CustomTextTitleAuth(text: AppLocalizations.of(context)!.auth33),
            const SizedBox(height: 10),
            CustomTextBodyAuth(
                text: AppLocalizations.of(context)!
                    .verfiyEmail(VerifyCodeCubit.verfiyEmail!)),
            const SizedBox(height: 15),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                BlocProvider.of<VerifyCodeCubit>(context).checkCode(UserEntity(
                    email: VerifyCodeCubit.verfiyEmail!,
                    verifyCode: verificationCode));
              }, // end onSubmit
            ),
            const SizedBox(height: 40),

           state is Loading ? const Center(child:  CircularProgressIndicator(color:AppColor.primaryColor,)):const SizedBox()
          ]),
        );
      },
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColor.backgroundcolor,
      elevation: 0.0,
      title: Text(AppLocalizations.of(context)!.auth32,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/localization/loclizationconfig/app_localization.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/utilits/functions/toast_message.dart';
import '../../../../core/utilits/functions/validinput.dart';
import '../../domain/entites/user_entity.dart';
import '../bloc/auth/forgotpassword/cubit/forgetpassword_cubit.dart';
import '../bloc/auth/forgotpassword/cubit/forgetpassword_state.dart';
import '../widgets/custombuttonauth.dart';
import '../widgets/customtextbodyauth.dart';
import '../widgets/customtextformauth.dart';
import '../widgets/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit,ForgetPasswordState >(
      listener: (context, state) {

              state.whenOrNull(
           success: (successMsg) =>showToast(successMsg,const Color.fromARGB(255, 14, 85, 1)),
            errors: (failureMsg) => showToast(failureMsg,const Color.fromARGB(202, 135, 16, 0)) );

      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: ForgetPasswordCubit.formstate,
            child: ListView(children: [
              const SizedBox(height: 20),
              CustomTextTitleAuth(text: AppLocalizations.of(context)!.auth19),
              const SizedBox(height: 10),
              CustomTextBodyAuth(text: AppLocalizations.of(context)!.auth21),
              const SizedBox(height: 15),
              CustomTextFormAuth(
                valid: (val) => validInput(val!, 5, 100, "email", context),
                textController: ForgetPasswordCubit.email,
                hinttext: AppLocalizations.of(context)!.auth4,
                iconData: Icons.email_outlined,
                labeltext: AppLocalizations.of(context)!.auth10,
                // mycontroller: ,
              ),
              CustomButtomAuth(
                state: state,
                  text: AppLocalizations.of(context)!.auth22,
                  onPressed: () {
                    BlocProvider.of<ForgetPasswordCubit>(context).entryEmail(
                        UserEntity(email: ForgetPasswordCubit.email.text));
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
      title: Text(AppLocalizations.of(context)!.auth6,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey)),
    );
  }
}

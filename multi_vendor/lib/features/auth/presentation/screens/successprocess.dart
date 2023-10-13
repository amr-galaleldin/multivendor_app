import 'package:ecommerceapp/config/localization/loclizationconfig/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/color.dart';
import '../bloc/auth/successproccess/cubit/success_cubit.dart';
import '../widgets/custombuttonauth.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Container _buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(children: [
        const Center(
            child: Icon(
          Icons.check_circle_outline,
          size: 200,
          color: AppColor.primaryColor,
        )),
        Text(AppLocalizations.of(context)!.auth29 ,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 30)),
        Text(SuccessCubit.resetOrVerfiyCodePage != null?SuccessCubit.resetOrVerfiyCodePage=="verfiy"?AppLocalizations.of(context)!.auth30:AppLocalizations.of(context)!.rePassword:""),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: CustomButtomAuth(

              text:AppLocalizations.of(context)!.auth23 ,
              onPressed: () {
                BlocProvider.of<SuccessCubit>(context).goToLogin();
              }),
        ),
        const SizedBox(height: 30)
      ]),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColor.backgroundcolor,
      elevation: 0.0,
      title: Text(AppLocalizations.of(context)!.auth24 ,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey)),
    );
  }
}

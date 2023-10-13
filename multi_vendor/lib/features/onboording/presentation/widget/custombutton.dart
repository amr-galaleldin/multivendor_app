import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/color.dart';
import '../../../../config/localization/loclizationconfig/app_localization.dart';
import '../../cubit/onboording_cubit.dart';
class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
            // cubit
            BlocProvider.of<OnboordingCubit>(context).nextEvent(context);
          },
          color: AppColor.primaryColor,
          child:  Text(AppLocalizations.of(context)!.onBoardingContinue)),
    );
  }
}

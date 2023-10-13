
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/onboording_cubit.dart';
import '../../data/datasource/static/static.dart';
import 'onboarding_entity_component.dart';

class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: OnboordingCubit.onBoordingController, //maybe error here
        onPageChanged: (val) {
      BlocProvider.of<OnboordingCubit>(context).onChangedEvent(val);
        },
        itemCount: onBoardingList(context).length,
        itemBuilder: (context, i) =>OnBoardingComponent(onBoardingEntity:onBoardingList(context)[i] ,));
  }
}

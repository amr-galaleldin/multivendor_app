
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constant/color.dart';
import '../../cubit/onboording_cubit.dart';
import '../../data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList(context).length,
                    (index) => BlocBuilder<OnboordingCubit, int>(
                      builder: (context, state) {
                        return AnimatedContainer(
                                              margin: const EdgeInsets.only(right: 5),
                                              duration: const Duration(milliseconds: 900),
                                              width: state == index ? 20 : 5,
                                              height: 6,
                                              decoration: BoxDecoration(
                                                  color: AppColor.primaryColor,
                                                  borderRadius: BorderRadius.circular(10)),
                                            );
                      },
                    ))
              ],
            );
  }
}

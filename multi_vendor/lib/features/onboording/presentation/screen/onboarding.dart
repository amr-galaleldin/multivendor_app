import 'package:flutter/material.dart';
import '../../../../core/constant/color.dart';
import '../widget/custombutton.dart';
import '../widget/customslider.dart';
import '../widget/dotcontroller.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        body: _buildBody());
  }
}










Widget _buildBody()=>const SafeArea(
            child: Column(children:  [
              Expanded(
                flex: 4,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDotControllerOnBoarding(),
                      Spacer(flex: 2),
                      CustomButtonOnBoarding()
                    ],
                  ))
            ]),
          );
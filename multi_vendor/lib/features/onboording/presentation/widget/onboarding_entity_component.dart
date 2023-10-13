import 'package:ecommerceapp/features/onboording/data/model/onboarding_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class OnBoardingComponent extends StatelessWidget {
  const OnBoardingComponent({
    Key? key,
    required this.onBoardingEntity,
  }) : super(key: key);

  final OnBoardingEntity onBoardingEntity;

  @override
  Widget build(BuildContext context) {
    return  Column(
              children: [
                Image.asset(
                 onBoardingEntity.image!,
                  // width: ,
                  height: MediaQuery.of(context).size.height/2.5,
                  // fit: BoxFit.fill,
                ),
                const SizedBox(height: 12),
                Text(onBoardingEntity.title!,
                    style:const TextStyle(fontSize: 22,
                  fontWeight: FontWeight.bold,  color: AppColor.black),),
                const SizedBox(height: 10),
          
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                     onBoardingEntity.body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 18),
                    )),
              ],
            );
  }
}

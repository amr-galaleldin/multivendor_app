import 'package:flutter/material.dart';

import '../../../../../config/localization/loclizationconfig/app_localization.dart';
import '../../../../../core/constant/imgaeasset.dart';
import '../../model/onboarding_entity.dart';

List<OnBoardingEntity>  onBoardingList(BuildContext context) => [
  OnBoardingEntity(
      title: AppLocalizations.of(context)!.onBoardingtitle1,
      body:AppLocalizations.of(context)!.onBoardingbody1,
      image: AppImageAsset.onBoardingImageOne),
  OnBoardingEntity(
      title:AppLocalizations.of(context)!.onBoardingtitle2,
      body:AppLocalizations.of(context)!.onBoardingbody2,
      image: AppImageAsset.onBoardingImageTwo),
  OnBoardingEntity(
      title:AppLocalizations.of(context)!.onBoardingtitle3,
      body:AppLocalizations.of(context)!.onBoardingbody3,
      image: AppImageAsset.onBoardingImageThree),

];

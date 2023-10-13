import 'package:ecommerceapp/config/localization/loclizationconfig/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/localization/controller/local_controller.dart';
import '../widget/custombuttomlang.dart';

class Language extends  GetView<LocaleController> {

 
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
  
    return Scaffold(
      body: _buildBody(context),
    );
  }







  Widget _buildBody(BuildContext context) {
    
    return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.chooseLang, style: Theme.of(context).textTheme. headlineLarge),
             SizedBox(height: MediaQuery.of(context).size.height/27),
            CustomButtonLang(
                textbutton:AppLocalizations.of(context)!.arabic,
                onPressed: () {
                //  BlocProvider.of<AppLocalizationCubit>(context).appLocalizationEvent(LanguagesCodeEnum.arabic);

                  controller.changeLang("ar");
                      // Get.offNamed(AppRouteName.onBoarding);
                }),
                SizedBox(height: MediaQuery.of(context).size.height/29),
            CustomButtonLang(
                textbutton: AppLocalizations.of(context)!.english,
                onPressed: () {
                   controller.changeLang("en");
                      //  Get.offNamed(AppRouteName.onBoarding);
                
                //  if(AppLocalizationCubit.revrseLocalState=="en"){context.pushNamed(AppRouteName.onBoarding);}
                    
                  // BlocProvider.of<AppLocalizationCubit>(context).appLocalizationEvent(LanguagesCodeEnum.english);

                 
                }),
          ],
        ));
  }
}

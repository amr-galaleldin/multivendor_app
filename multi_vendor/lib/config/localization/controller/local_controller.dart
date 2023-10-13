
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../injection_container.dart';
import '../../routing/app_routes_info/app_routes_name.dart';
import '../../theme/arabic_text_theme/arabic_theme_data.dart';
import '../../theme/english_text_theme/english_theme_data.dart';

class LocaleController extends GetxController {
  
  Locale? language;

  

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
     sl<SharedPreferences>().setString("langauage", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
    Get.toNamed(AppRouteName.onBoarding);


  }

  @override
  void onInit() {
    String? sharedPrefLang =  sl<SharedPreferences>().getString("langauage");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}










//sl<SharedPreferences>().getString("langauage")
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../injection_container.dart';
import '../app_routes_info/app_route_path.dart';

class AppRedirection extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (sl<SharedPreferences>().getString("redirectLocation") ==
        AppRoutePath.login) {
      return const RouteSettings(name: AppRoutePath.login);
    }

    return null;
  }
}

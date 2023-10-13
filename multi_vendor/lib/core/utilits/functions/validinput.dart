

import 'package:ecommerceapp/config/localization/loclizationconfig/app_localization.dart';
import 'package:flutter/material.dart';

validInput(String value, int min, int max, String type,BuildContext context) {

    if (value.isEmpty) {
    return AppLocalizations.of(context)!.validatorl;
  }

  if (value.length < min) {
    return "${AppLocalizations.of(context)!.validator2} $min";
  }

  if (value.length > max) {
    return "${AppLocalizations.of(context)!.validator3} $max";
  }


  
  if (type == "username") {
   
    if ( !RegExp(r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$').hasMatch(value) ) {
      return AppLocalizations.of(context)!.validatorUsername;
    }
  }
  if (type == "email") {
    if (! RegExp( r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value))
     {
      return AppLocalizations.of(context)!.validatorEmail;
    }
  }

  if (type == "phone") {
    if (!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(value)) {
      return AppLocalizations.of(context)!.validatorPhome;
    }
  }


}

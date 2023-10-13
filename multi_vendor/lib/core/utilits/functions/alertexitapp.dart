import 'dart:io';
import 'package:ecommerceapp/config/localization/loclizationconfig/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/color.dart';

Future<bool> alertExitApp(BuildContext context) {

showDialog(context: context, builder: (context)=> AlertDialog(
    title:  Text(AppLocalizations.of(context)!.alertTitle,style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColor.primaryColor),),
      content:  Text(AppLocalizations.of(context)!.alertBody,style: Theme.of(context).textTheme.bodyLarge,),

  actions:
   [
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColor.primaryColor)),
              onPressed: () {
                exit(0);
              },
              child: Text(AppLocalizations.of(context)!.confirm,style: Theme.of(context).textTheme.displayLarge!.copyWith(color:Colors.white),)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColor.primaryColor)),
              onPressed: () {
               Get.back();
              },
              child: Text(AppLocalizations.of(context)!.cancel,style: Theme.of(context).textTheme.displayLarge!.copyWith(color:Colors.white),)),
        )
       ],)
      ]
));


return Future.value(true);
}


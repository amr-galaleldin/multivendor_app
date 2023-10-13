import 'package:ecommerceapp/features/auth/presentation/bloc/auth/forgotpassword/cubit/forgetpassword_cubit.dart';
import 'package:ecommerceapp/features/auth/presentation/bloc/auth/verfiycode/cubit/verifycode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'config/localization/controller/local_controller.dart';
import 'config/localization/loclizationconfig/app_localization.dart';
import 'config/routing/app_routingconfig/app_router_configuration.dart';
import 'features/auth/presentation/bloc/auth/login/cubit/sign_in_cubit.dart';
import 'features/auth/presentation/bloc/auth/passwordcubit/password_cubit.dart';
import 'features/auth/presentation/bloc/auth/resetpassword/cubit/resetpasword_cubit.dart';
import 'features/auth/presentation/bloc/auth/signup/cubit/signup_cubit.dart';
import 'features/auth/presentation/bloc/auth/successproccess/cubit/success_cubit.dart';
import 'features/onboording/cubit/onboording_cubit.dart';
import 'injection_container.dart' as di;


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
     LocaleController local = Get.put(LocaleController());

   return  MultiBlocProvider(
  providers: [
    BlocProvider(create: (context) => di.sl<VerifyCodeCubit>(),),
    BlocProvider(create: (context) => di.sl<SuccessCubit>(),),
    BlocProvider(create: (context) => di.sl <SignupCubit>(),),
    BlocProvider(create: (context) => di.sl<ResetPasswordCubit>(),),
    BlocProvider(create: (context) => di.sl<ForgetPasswordCubit>(),),
    BlocProvider(create: (context) => di.sl<SignInCubit>(),),
    BlocProvider(create: (context) => di.sl<PasswordCubit>(),),
    // BlocProvider<AppLocalizationCubit>(
    //   create: (context) => di.sl<AppLocalizationCubit>()
    //     ..appLocalizationEvent(LanguagesCodeEnum.initial),
    // ),
    BlocProvider<OnboordingCubit>(
      create: (context) => di.sl<OnboordingCubit>(),
    ),
  ],
  child: GetMaterialApp(
    

          locale: local.language,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: local.appTheme,
          
   
     getPages:routes ,

          
        )
      );
  }
}



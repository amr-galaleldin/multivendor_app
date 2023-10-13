import 'package:dio/dio.dart';
import 'package:ecommerceapp/features/auth/domain/usecases/signup_use_cases.dart';
import 'package:ecommerceapp/features/auth/presentation/bloc/auth/forgotpassword/cubit/forgetpassword_cubit.dart';
import 'package:ecommerceapp/features/auth/presentation/bloc/auth/login/cubit/sign_in_cubit.dart';
import 'package:ecommerceapp/features/auth/presentation/bloc/auth/passwordcubit/password_cubit.dart';
import 'package:ecommerceapp/features/auth/presentation/bloc/auth/resetpassword/cubit/resetpasword_cubit.dart';
import 'package:ecommerceapp/features/auth/presentation/bloc/auth/signup/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network_info.dart';
import 'features/auth/data/datasourses/remote_data_source/auth_remote_date_sources.dart';
import 'features/auth/data/repositories/authuntaction_repository_imp.dart';
import 'features/auth/domain/repositories/authuntaction_repository.dart';
import 'features/auth/domain/usecases/delete_account_use_cases.dart';
import 'features/auth/domain/usecases/forget_password_use_cases.dart';
import 'features/auth/domain/usecases/forgetpass_verification_use_cases.dart';
import 'features/auth/domain/usecases/reset_password_use_cases.dart';
import 'features/auth/domain/usecases/signin_use_cases.dart';
import 'features/auth/domain/usecases/signup_verification_use_cases.dart';
import 'features/auth/presentation/bloc/auth/successproccess/cubit/success_cubit.dart';
import 'features/auth/presentation/bloc/auth/verfiycode/cubit/verifycode_cubit.dart';
import 'features/onboording/cubit/onboording_cubit.dart';
final sl = GetIt.instance;

Future<void> setup()async {




//cubit

sl.registerFactory(() =>VerifyCodeCubit(sl(),sl()));
sl.registerFactory(() =>SuccessCubit());
sl.registerFactory(() =>SignInCubit(sl()));
sl.registerFactory(() =>SignupCubit( sl()));
sl.registerFactory(() =>ForgetPasswordCubit(sl()));
sl.registerFactory(() =>ResetPasswordCubit(sl()));
sl.registerFactory(() =>PasswordCubit());
sl.registerFactory(() =>OnboordingCubit());







//usecases
sl.registerFactory(() =>SignUpUseCase(authRepository: sl()));
sl.registerLazySingleton(()=> SignInUseCase(authRepository: sl()  ));
sl.registerLazySingleton(()=> SignUpVerifyUseCase(authRepository: sl()  ));
sl.registerLazySingleton(()=> ForgrtPasswordUseCase(authRepository: sl()  ));
sl.registerLazySingleton(()=> ForgrtPasswordVerificationUseCase(authRepository: sl()  ));
sl.registerLazySingleton(()=> ResetPasswordUseCase(authRepository: sl()  ));
sl.registerLazySingleton(()=> DeleteAccountUseCase(authRepository: sl()  ));







//repo

sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authDataSources: sl(),networkInfo: sl()));




//datasources

sl.registerLazySingleton(() => AuthRemoteDataSources(sl()));


//other
sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
sl.registerLazySingleton(() => InternetConnectionChecker());
final sharedPreferences = await SharedPreferences.getInstance();
sl.registerLazySingleton(() => sharedPreferences);
sl.registerLazySingleton(() =>Dio());




 
}
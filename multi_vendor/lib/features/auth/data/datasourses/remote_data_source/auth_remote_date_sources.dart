

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constant/links.dart';
import '../../models/user_model.dart';

part 'auth_remote_date_sources.g.dart';

@RestApi(baseUrl:AppLinks.baseUrl)
abstract class AuthRemoteDataSources {
  factory AuthRemoteDataSources(Dio dio, {String baseUrl}) = _AuthRemoteDataSources;




@POST("signup")
Future<String>signUp(@Body() UserModel user);


@POST("signin")
Future<String>signIn(@Body() UserModel user);

@PATCH("signup/verify")
Future<String>signUpVerification( @Body() UserModel user);

@PATCH("forgetpassword")
Future<String>forgrtPassword(@Body() UserModel user);

@GET("forgetpassword/verify")
Future<String>forgrtPasswordVerification( @Body() UserModel user);


@PATCH("forgetpassword/resetpassword")
Future<String>resetPassword( @Body() UserModel user);


@DELETE("deleteaccount/{id}")
Future<String>deleteAccount(@Path() String id);



}

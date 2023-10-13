import 'package:ecommerceapp/core/data_state/api_result.dart';
import 'package:ecommerceapp/features/auth/domain/entites/user_entity.dart';

import '../../../../core/errors/network_exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/authuntaction_repository.dart';
import '../datasourses/remote_data_source/auth_remote_date_sources.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSources authDataSources;

  AuthRepositoryImpl({
    required this.networkInfo,
    required this.authDataSources,
  });

  @override
  Future<DataState<String>> deleteAccount(String id) async {
    if (await networkInfo.isConnected) {
      try {
        String response = await authDataSources.deleteAccount(id);

        return DataState.success(response);
      } catch (error) {
        return DataState.failure(NetworkExceptions.getDioException(error));
      }
    } else {
      return const DataState.failure(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<DataState<String>> forgrtPassword(UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = UserModel(
            email: user.email,);

        String response = await authDataSources.forgrtPassword(userModel);

        return DataState.success(response);
      } catch (error) {
        return DataState.failure(NetworkExceptions.getDioException(error));
      }
    } else {
      return const DataState.failure(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<DataState<String>> forgrtPasswordVerification(
 UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = UserModel(verifyCode: user.verifyCode,email: user.email);

        String response =
            await authDataSources.forgrtPasswordVerification( userModel);

        return DataState.success(response);
      } catch (error) {
        return DataState.failure(NetworkExceptions.getDioException(error));
      }
    } else {
      return const DataState.failure(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<DataState<String>> resetPassword( UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = UserModel(
          password: user.password,
          email: user.email
            );

        String response = await authDataSources.resetPassword( userModel);

        return DataState.success(response);
      } catch (error) {
        return DataState.failure(NetworkExceptions.getDioException(error));
      }
    } else {
      return const DataState.failure(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<DataState<String>> signIn(UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = UserModel(
            email: user.email,
            password: user.password,);

        String response = await authDataSources.signIn(userModel);

        return DataState.success(response);
      } catch (error) {
        return DataState.failure(NetworkExceptions.getDioException(error));
      }
    } else {
      return const DataState.failure(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<DataState<String>> signUp(UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = UserModel(
            email: user.email,
            password: user.password,
            phone: user.phone,
            username: user.username);

        String response = await authDataSources.signUp(userModel);

        return DataState.success(response);
      } catch (error) {
        return DataState.failure(NetworkExceptions.getDioException(error));
      }
    } else {
      return const DataState.failure(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<DataState<String>> signUpVerification( UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = UserModel(verifyCode: user.verifyCode,email: user.email);

        String response =
            await authDataSources.signUpVerification(userModel);

        return DataState.success(response);
      } catch (error) {
        return DataState.failure(NetworkExceptions.getDioException(error));
      }
    } else {
      return const DataState.failure(NetworkExceptions.noInternetConnection());
    }
  }
}

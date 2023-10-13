
import '../../../../core/data_state/api_result.dart';
import '../entites/user_entity.dart';

abstract class AuthRepository {
  Future<DataState<String>> signUp(UserEntity user);
 Future<DataState<String>> signIn(UserEntity user);
  Future<DataState<String>> signUpVerification(UserEntity user);
  Future<DataState<String>> forgrtPassword(UserEntity user);
   Future<DataState<String>> forgrtPasswordVerification(UserEntity user);
  Future<DataState<String>> resetPassword(UserEntity user);
  Future<DataState<String>> deleteAccount(String id);
}

   
import '../../../../core/data_state/api_result.dart';
import '../entites/user_entity.dart';
import '../repositories/authuntaction_repository.dart';

class ForgrtPasswordVerificationUseCase {
final AuthRepository authRepository;
ForgrtPasswordVerificationUseCase({
    required this.authRepository,
  });
 
Future<DataState<String>> call(UserEntity user)async{


  return await authRepository.forgrtPasswordVerification(user);
}


} 

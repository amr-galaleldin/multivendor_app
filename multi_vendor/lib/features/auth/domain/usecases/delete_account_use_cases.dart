import '../../../../core/data_state/api_result.dart';
import '../repositories/authuntaction_repository.dart';

class DeleteAccountUseCase {
final AuthRepository authRepository;
  DeleteAccountUseCase({
    required this.authRepository,
  });
 
Future<DataState<String>> call(String id)async{


  return await authRepository.deleteAccount(id);
}


} 

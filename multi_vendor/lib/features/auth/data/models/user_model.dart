import '../../domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    String? uId,
    String? email,
    String? username,
    String? password,
    String? phone,
    String? verifyCode,
    String? userApproval,
    String? accountCreated,
    String? imgProfile,
  }) : super(
            uId: uId,
            email: email,
            username: username,
            phone: phone,
            password: password,
            verifyCode: verifyCode,
            userApproval: userApproval,
            accountCreated: accountCreated,
            imgProfile: imgProfile);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uId: json['u_id'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        phone: json['phone'],
        verifyCode: json['verify_code'],
        userApproval: json['user_approval'],
        accountCreated: json['account_created'],
        imgProfile: json['img_profile'],
      );

//  {

//   }

  Map<String, dynamic> toJson() => {
        'u_id': uId,
        'email': email,
        'username': username,
        'password': password,
        'phone': phone,
        'verify_code': verifyCode,
        'user_approval': userApproval,
        'account_created': accountCreated,
        'img_profile': imgProfile,
      };
}

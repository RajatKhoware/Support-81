
class SignupResponse {
  final String responseMessage;
  final int responseCode;
  final String token;
  final User user;

  SignupResponse({
    required this.responseMessage,
    required this.responseCode,
    required this.token,
    required this.user,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      responseMessage: json['response_message'] as String,
      responseCode: json['response_code'] as int,
      token: json['token'] as String,
      user: User.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String mobile;
  final String password;
  final String? dob;
  final String status;
  final String updatedAt;
  final String createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.password,
    required this.dob,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      password: json['password'] as String,
      dob: json['dob'] as String?,
      status: json['status'] as String,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
    );
  }
}
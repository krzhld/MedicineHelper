class UserModel {
  UserModel({
    required this.email,
    required this.role,
  });

  UserModel.fromJson(Map<String, Object?> json)
      : this(
          email: json['email']! as String,
          role: json['role']! as String,
        );

  final String email;
  final String role;

  Map<String, Object> toJson() {
    return {
      'email': email,
      'role': role,
    };
  }
}

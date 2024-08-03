class RegistrationParams {
  final String name;
  final String email;
  final String avatar;
  final String password;

  RegistrationParams({
    required this.name,
    required this.email,
    required this.avatar,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "avatar": avatar,
      };
}

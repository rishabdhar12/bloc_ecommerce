class RegistrationParams {
  final String username;
  final String name;
  final String email;
  final String password;
  final String phoneNumber;

  RegistrationParams({
    required this.username,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
        "email": email,
        "password": password,
        "phoneNo": phoneNumber,
      };
}

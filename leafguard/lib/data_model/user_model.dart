class UserModel {
  final String name;
  final String email;
  final String phoneNo;
  final String password;
  final String confirmPassword;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.password,
    required this.confirmPassword,
  });

  // Create a UserModel from a Supabase map (e.g., from a row)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNo: map['phoneNo'] ?? '',
      password: map['password'] ?? '',
      confirmPassword: map['confirmPassword'] ?? '',
    );
  }

  // Convert UserModel to Map for Supabase
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNo': phoneNo,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}

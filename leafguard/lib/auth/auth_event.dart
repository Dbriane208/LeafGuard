import 'package:equatable/equatable.dart';
import 'package:leafguard/data_model/user_model.dart';

abstract class AppEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterUserEvent extends AppEvent {
  final UserModel user;
  RegisterUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginUserEvent extends AppEvent {
  final String email;
  final String password;

  LoginUserEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

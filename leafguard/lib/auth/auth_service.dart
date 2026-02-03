import 'package:leafguard/app_state.dart';
import 'package:leafguard/data_model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<AppState> registerUser(UserModel user) async {
    try {
      final response = await supabase.auth.signUp(
        email: user.email,
        password: user.password,
        data: {
          'name': user.name,
          'phoneNo': user.phoneNo,
        },
      );

      if (response.user != null) {
        await supabase.from('users').insert({
          'name': user.name,
          'email': user.email,
          'phoneNo': user.phoneNo,
        });
        return SuccessState(
            'Registration successful! Please verify your email.');
      } else {
        return ErrorState('Registration failed');
      }
    } catch (e) {
      return ErrorState(e.toString());
    }
  }

  Future<AppState> loginUser(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        return SuccessState('Login successful!');
      } else {
        return ErrorState('Login failed');
      }
    } catch (e) {
      return ErrorState(e.toString());
    }
  }
}

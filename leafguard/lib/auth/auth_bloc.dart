import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafguard/app_state.dart';
import 'package:leafguard/auth/auth_event.dart';
import 'package:leafguard/auth/auth_service.dart';
import 'package:leafguard/utils/utils.dart';

class AuthBloc extends Bloc<AppEvent, AppState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(InitialState()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(LoadingState());

      final error = await checkUserInput(event.user);

      if (error != null) {
        emit(ErrorState(error));
        return;
      }

      try {
        final result = await _authService.registerUser(event.user);

        if (result is SuccessState) {
          emit(SuccessState(result.message));
        } else if (result is ErrorState) {
          emit(ErrorState(result.error));
        } else {
          emit(ErrorState("Registration failed. Please try again"));
        }
      } catch (e) {
        emit(ErrorState("Error occured while registering"));
      }
    });

    on<LoginUserEvent>((event, emit) async {
      emit(LoadingState());

      try {
        final result =
            await _authService.loginUser(event.email, event.password);
        if (result is SuccessState) {
          emit(SuccessState(result.message));
        } else if (result is ErrorState) {
          emit(ErrorState(result.error));
        } else {
          emit(ErrorState("Login failed. Please try again"));
        }
      } catch (e) {
        emit(ErrorState("Error occurred while logging in"));
      }
    });
  }
}

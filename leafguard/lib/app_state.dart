import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends AppState {}

class LoadingState extends AppState {}

class SuccessState extends AppState {
  final String message;
  SuccessState(this.message);
}

class ErrorState extends AppState {
  final String error;
  ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

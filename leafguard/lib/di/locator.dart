import 'package:get_it/get_it.dart';
import 'package:leafguard/auth/auth_bloc.dart';
import 'package:leafguard/auth/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => Supabase.instance.client);
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerFactory(() => AuthBloc(getIt<AuthService>()));
}

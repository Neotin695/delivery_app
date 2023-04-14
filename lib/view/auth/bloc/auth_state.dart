part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class NoInternetState extends AuthState {
  final String message;

  NoInternetState({required this.message});
}

class VerifyCompleteState extends AuthState {}

class VerifyFailedState extends AuthState {
  final String message;

  VerifyFailedState({required this.message});
}

class AlreadyUserState extends AuthState {}

class CodeSentState extends AuthState {
  final String code;

  CodeSentState({required this.code});
}

class CodeAutoRetrievalTimeoutState extends AuthState {
  final String verificationId;

  CodeAutoRetrievalTimeoutState({required this.verificationId});
}

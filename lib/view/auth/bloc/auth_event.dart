part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class InitialEvent extends AuthEvent {}

class VerifyPhoneNumberEvent extends AuthEvent {}

class SentVerificationcodeEvent extends AuthEvent {}

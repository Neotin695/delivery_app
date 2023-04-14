import 'dart:async';

import 'package:delivery/core/services/internet_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constances/app_const.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static AuthBloc get(context) => BlocProvider.of(context);
  final TextEditingController phoneNum = TextEditingController();
  final TextEditingController smsCode = TextEditingController();
  final GlobalKey<FormState> formKeyAuthSignUp = GlobalKey();
  final GlobalKey<FormState> formKeyAuthVerifyCode = GlobalKey();

  String verificationId = '';

  AuthBloc() : super(AuthInitial()) {
    on<InitialEvent>(_initialEvent);
    on<VerifyPhoneNumberEvent>(_verifyPhoneNumber);
    on<SentVerificationcodeEvent>(_sentVerifiCode);
  }

  Future<bool> get isConnected async =>
      await InternetCheckerService().isConnected();
  bool alreadyUser(UserCredential user) => user.additionalUserInfo!.isNewUser;

  FutureOr<void> _initialEvent(event, emit) async {
    if (!await isConnected) {
      emit(NoInternetState(message: AppConst.noNetTxt));
    }
  }

  final _auth = FirebaseAuth.instance;
  FutureOr<void> _verifyPhoneNumber(event, emit) async {
    await _initialEvent(event, emit);
    await _auth.verifyPhoneNumber(
        phoneNumber: AppConst.countryCode + phoneNum.text,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (credential) =>
            _verifyCompleted(credential, emit),
        verificationFailed: (expcetion) => _verifyFailed(expcetion, emit),
        codeSent: (verifyId, code) => _codeSent(verifyId, code, emit),
        codeAutoRetrievalTimeout: (verifyId) =>
            _codeAutoRetrievalTimeout(verifyId, emit));
  }

  FutureOr<void> _verifyCompleted(PhoneAuthCredential credential, emit) async {
    final user = await _signInCredential(credential);
    if (alreadyUser(user)) {
      emit(AlreadyUserState());
    } else {
      emit(VerifyCompleteState());
    }
  }

  Future<UserCredential> _signInCredential(
          PhoneAuthCredential credential) async =>
      await _auth.signInWithCredential(credential);

  Future<void> _verifyFailed(FirebaseAuthException exception, emit) async {
    if (exception.code == 'invalid-phone-number') {
      emit(VerifyFailedState(message: 'invalide phone number!'));
      return;
    }
  }

  void _codeSent(String verificationId, int? forceResendingToken, emit) async {
    if (!await isConnected) {
      emit(NoInternetState(message: AppConst.noNetTxt));
      return;
    }
    this.verificationId = verificationId;
    emit(CodeSentState(code: verificationId));
    final credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: smsCode.text);

    _verifyCompleted(credential, emit);
  }

  void _codeAutoRetrievalTimeout(String verificationId, emit) {
    this.verificationId = verificationId;
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return AppConst.phoneValideTxt;
    }
  }

  FutureOr<void> _sentVerifiCode(
      SentVerificationcodeEvent event, Emitter<AuthState> emit) {}
}

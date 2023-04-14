import 'package:cool_alert/cool_alert.dart';
import 'package:delivery/view/auth/bloc/auth_bloc.dart';
import 'package:delivery/view/auth/screen/signup_phone_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constances/app_const.dart';
import '../../../core/constances/media_const.dart';
import '../../home/screen/home_page.dart';

class VerifyCodeView extends StatelessWidget {
  final AuthBloc bloc;
  const VerifyCodeView({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is VerifyCompleteState) {
          Navigator.pushReplacementNamed(context, HomeLayoutPage.routeName);
        } else if (state is VerifyFailedState) {
          showMessage(context, state.message);
        } else if (state is NoInternetState) {
          showMessage(context, state.message);
        } else if (state is AlreadyUserState) {
          showMessage(context, 'you already our user!, please back to sign in');
        }
      },
      child: Form(
        key: bloc.formKeyAuthVerifyCode,
        child: Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  MediaConst.auth,
                  width: 30.w,
                  height: 30.h,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  AppConst.verifyCodeTxt,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  AppConst.enterCodeTxt,
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 7.sp,
                ),
                Pinput(
                  controller: bloc.smsCode,
                  length: 6,
                  onChanged: (value) {},
                  showCursor: true,
                  onCompleted: (pin) => bloc.smsCode.text = pin,
                ),
                SizedBox(
                  height: 5.sp,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFAAF3B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      if (!bloc.formKeyAuthVerifyCode.currentState!.validate())
                        return;
                      bloc.add(VerifyPhoneNumberEvent());
                    },
                    child: Text(AppConst.confirmTxt)),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SignUpPage.routeName);
                        },
                        child: Text(
                          AppConst.changePhoneTxt,
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.normal),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showMessage(BuildContext context, state) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      text: state,
      onCancelBtnTap: () => Navigator.pop(context),
    );
  }
}

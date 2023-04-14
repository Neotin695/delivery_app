import 'package:delivery/core/shardwidget/custom_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constances/app_const.dart';
import '../../../core/constances/media_const.dart';
import '../bloc/auth_bloc.dart';

class SignUpPhoneView extends StatelessWidget {
  const SignUpPhoneView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = AuthBloc.get(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Form(
          key: bloc.formKeyAuthSignUp,
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    MediaConst.logo,
                    width: 30.w,
                    height: 30.h,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    AppConst.welcomeTxt,
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    AppConst.wordLandkTxt,
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 3.sp,
                  ),
                  CustomTextFormField(
                    controller: bloc.phoneNum,
                    label: AppConst.phoneTxt,
                    validtor: bloc.validator,
                    type: TextInputType.number,
                    preWidget: SvgPicture.asset(
                      MediaConst.libya,
                      width: 3.w,
                      height: 2.h,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFAAF3B),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        if (!bloc.formKeyAuthSignUp.currentState!.validate())
                          return;
                        bloc.add(VerifyPhoneNumberEvent());
                      },
                      child: Text(AppConst.continueTxt))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

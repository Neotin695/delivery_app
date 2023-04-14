import 'package:cool_alert/cool_alert.dart';
import 'package:delivery/view/auth/components/signup_phone_view.dart';
import 'package:delivery/view/auth/components/verify_code_view.dart';
import 'package:delivery/view/auth/screen/complete_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class SignUpFormView extends StatelessWidget {
  const SignUpFormView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = AuthBloc.get(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is CodeSentState) {
          return VerifyCodeView(bloc: bloc);
        } else if (state is VerifyCompleteState) {
          Navigator.pushReplacementNamed(context, CompleteInfoPage.routeName);
        } else if (state is VerifyFailedState) {
          showMessage(context, state.message);
        } else if (state is NoInternetState) {
          showMessage(context, state.message);
        } else if (state is AlreadyUserState) {
          showMessage(context, 'you already our user!, please back to sign in');
        }
        return SignUpPhoneView();
      },
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

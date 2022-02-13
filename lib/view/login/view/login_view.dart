import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:waseat/core/constants/image/image_constants.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/components/text/auto_locale_text.dart';
import '../../../core/constants/image/svg_constants.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
          Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Spacer(
                flex: 3,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                height:
                    context.isKeyBoardOpen ? 20 : context.dynamicHeight(0.20),
                child: context.isKeyBoardOpen
                    ? SizedBox()
                    : topWelcomeArea(context),
              ),
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                height: context.dynamicHeight(0.06),
                child: Text(
                  LocaleKeys.Login_signIn.locale,
                  style: context.textTheme.headline5!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.primaryVariant,
             ),
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.04),
              ),
              inputArea(viewModel),
              Expanded(
                flex: 2,
                child: forgotPasswordArea(context),
              ),
              const Spacer(flex: 2),
              ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: context.width * 0.1, minWidth: double.infinity),
                child: loginButton(context, viewModel),
              ),
              Expanded(
                flex: 4,
                child: createAccountArea(context),
              ),
              Expanded(flex: 7, child: Container())
            ],
          ),
        ),
      ),
    );
  }
    
  Column topWelcomeArea(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 8, child: Container()),
        Image.asset(
          ImageConstants.instance.logoNameColored),
       const Spacer(
                flex: 10,
        ),
        SizedBox(
          child: Expanded(
            flex: 1,
            child: Text(LocaleKeys.welcome.locale,
                style: context.textTheme.headline1!.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: context.colorScheme.primaryVariant,
             ),),),
        )
      ],
    );
  }
  

  Form inputArea(LoginViewModel viewModel) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            controller: viewModel.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration:
                InputDecoration(labelText: LocaleKeys.Input_email.locale),
            validator: (value) => value!.isValidEmail
                ? null
                : LocaleKeys.Login_pleaseProvideEmail,
          ),
          const SizedBox(height: 30),
          Observer(builder: (_) {
            return TextFormField(
              controller: viewModel.passwordController,
              obscureText: viewModel.isPasswordLocked,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      viewModel.isPassworkdLockedChange();
                    },
                    icon: Observer(builder: (_) {
                      return Icon(
                        viewModel.isPasswordLocked
                            ? Icons.visibility
                            : Icons.visibility_off,
                      );
                    }),
                  ),
                  contentPadding: const EdgeInsets.all(0),
                  labelText: LocaleKeys.Input_password.locale),
              validator: (value) {
                if (value!.isEmpty)
                  return LocaleKeys.Login_pleaseProvideEmail.locale;
                if (value.length < 8 || value.length > 14) {
                  return LocaleKeys.Login_passwordValidation.locale;
                }
                return null;
              },
            );
          })
        ],
      ),
    );
  }

  Row forgotPasswordArea(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Text(
            LocaleKeys.Login_forgotPassword.locale,
            style: context.textTheme.headline6!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: context.colorScheme.primaryVariant,
             ),
          ),
        ),
      ],
    );
  }

  ElevatedButton loginButton(BuildContext context, LoginViewModel viewModel) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
      primary: context.colorScheme.secondary,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.lowValue),
        ),
      ),
      child: const AutoLocaleText(value: LocaleKeys.Button_login),
      onPressed: () => {viewModel.postLogin()},
    );
  }
  Row createAccountArea(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Expanded(
            flex: 1,
            child: Text(LocaleKeys.createAccountText.locale,
                style: context.textTheme.headline6!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.primaryVariant,
         ),
        ),),
      ),
      const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Text(
            LocaleKeys.Login_createAccount.locale,
            style: context.textTheme.headline6!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.secondary,
             ),
          ),
        ),
      ]
      
    );
  }
}
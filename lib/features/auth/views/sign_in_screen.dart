import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/services/routes.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/validators.dart';
import 'package:viewing_nz/core/widgets/input_field.dart';
import 'package:viewing_nz/core/widgets/submit_button.dart';
import 'package:viewing_nz/features/auth/widgets/sign_in_button.dart';
import 'package:viewing_nz/features/auth/widgets/social_divider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // ---------- Top content ----------
                          Text(
                            'Log In',
                            style: context.headlineMedium,
                            textAlign: TextAlign.center,
                          ),
                          const Gap(12),
                          Text(
                            'Store your favorite properties in one place and receive price change alerts.',
                            style: context.titleMedium.copyWith(
                              color: AppColors.gray700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // ---------- Spacer pushes the bottom buttons ----------
                          const Spacer(),

                          // ---------- Bottom content ----------
                          InputField(
                            hintText: "Enter email",
                            labelText: "Email",
                            textInputType: TextInputType.emailAddress,
                            validator: Validators.email,
                          ),
                          const Gap(16),
                          InputField(
                            hintText: "Enter password",
                            labelText: "Password",
                            textInputType: TextInputType.visiblePassword,
                            obscureText: true,
                            validator: Validators.password,
                          ),
                          const Gap(6),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password',
                              style: context.titleMedium.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Gap(32),
                          SubmitButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {}
                              context.go(Routes.home);
                            },
                            text: 'Log In',
                          ),
                          const Gap(32),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style: context.titleMedium.copyWith(
                                color: AppColors.gunmetal600,
                              ),
                              children: [
                                TextSpan(
                                  text: "Create an account",
                                  style: context.titleMedium.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.go(Routes.register);
                                    },
                                ),
                              ],
                            ),
                          ),
                          SocialDivider(),
                          SignInButton(
                            iconPath: 'assets/icons/google.svg',
                            text: "Continue with Google",
                            onPressed: () {},
                          ),
                          SignInButton(
                            iconPath: 'assets/icons/facebook.svg',
                            text: "Continue with Facebook",
                            onPressed: () {},
                          ),
                          SignInButton(
                            iconPath: 'assets/icons/apple.svg',
                            text: "Continue with Apple",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

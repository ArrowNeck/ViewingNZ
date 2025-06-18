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
import 'package:viewing_nz/features/auth/widgets/terms_privacy.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // -------- Top content --------
                          Text(
                            'Create a New Account',
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
                          // -------- Pushes below section to the bottom --------
                          const Gap(40),
                          // -------- Bottom social buttons + terms --------
                          InputField(
                            labelText: "Name",
                            hintText: "Enter name",
                            textInputType: TextInputType.name,
                            validator: Validators.name,
                          ),
                          const Gap(16),
                          InputField(
                            labelText: "Mobile Number",
                            hintText: "+64 275 555 58",
                            textInputType: TextInputType.phone,
                            validator: Validators.mobileNumber,
                          ),
                          const Gap(16),
                          InputField(
                            labelText: "Password",
                            hintText: "Enter password",
                            textInputType: TextInputType.visiblePassword,
                            obscureText: true,
                            validator: Validators.password,
                          ),
                          const Gap(32),
                          SubmitButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {}
                            },
                            text: 'Create Account',
                          ),
                          const Gap(32),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: context.titleMedium.copyWith(
                                color: AppColors.gunmetal600,
                              ),
                              children: [
                                TextSpan(
                                  text: "Log In",
                                  style: context.titleMedium.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.go(Routes.login);
                                    },
                                ),
                              ],
                            ),
                          ),
                          const SocialDivider(),
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
                          const TermsPrivacy(),
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

import 'package:css_signup_ui/components/custom_button.dart';
import 'package:css_signup_ui/components/dialogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:super_icons/super_icons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  final PhoneController _phoneController = PhoneController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _dismissKeyboard,
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sign Up & Enjoy the\nWorld Of CSS",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text("Start your journey in just a few clicks."),
              const SizedBox(height: 10),
              PhoneFormField(
                controller: _phoneController,
                onSubmitted: (PhoneNumber) => {
                  showPhoneDialog(
                    context,
                    phoneNumber: _phoneController.value,
                  )
                },
                keyboardType: TextInputType.number,
                textAlignVertical: TextAlignVertical.center,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(9),
                ],
                isCountrySelectionEnabled: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Get Started',
                onPressed: () {
                  showPhoneDialog(
                    context,
                    phoneNumber: _phoneController.value,
                  );
                },
                backgroundColor: const Color.fromARGB(255, 11, 15, 247),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomButton(
                textColor: Colors.black,
                backgroundColor: Colors.white,
                text: 'Continue with Apple',
                icon: SuperIcons.bs_apple,
                onPressed: () {},
              ),
              CustomButton(
                textColor: Colors.black,
                backgroundColor: Colors.white,
                text: 'Continue with Google',
                icon: SuperIcons.bs_google,
                onPressed: () {},
              ),
              CustomButton(
                textColor: Colors.black,
                backgroundColor: Colors.white,
                text: 'Continue with Facebook',
                icon: SuperIcons.bs_facebook,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

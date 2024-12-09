import 'package:css_signup_ui/pages/forms_page.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

/// A reusable function to display a phone number dialog
void showPhoneDialog(BuildContext context, {PhoneNumber? phoneNumber}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Phone Number'),
      content: Text(
        phoneNumber != null
            ? 'Is ${phoneNumber.international} your correct phone number?'
            : 'Please enter a valid phone number',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Close'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => FormsPage()));
          },
          child: Text('Proceed'),
        ),
      ],
    ),
  );
}

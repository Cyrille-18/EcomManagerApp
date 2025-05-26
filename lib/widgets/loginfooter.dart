import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:maplenou/widgets/reset_password_dialog.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text:
            "En cas de problème de connexion, veuillez contacter votre administrateur ou ",
        style: const TextStyle(fontSize: 12, color: Colors.black54),
        children: [
          TextSpan(
            text: "réinitialiser votre mot de passe ici.",
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                showDialog(
                  context: context,
                  builder: (_) => const ResetPasswordDialog(),
                );
              },
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/router/router.dart';
import '../../sign_up/sign_up_view.dart';

class SignUpRow extends StatelessWidget {
  const SignUpRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: const Text('Don\'t have an account?'),
              padding: const EdgeInsets.symmetric(vertical: 8)),
          GestureDetector(
            onTap: () => MagicRouter.navigateAndPopAll(const SignUpView()),
            child: Container(
                child: const Text(' Signup.',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                padding: const EdgeInsets.symmetric(vertical: 8)),
          ),
        ],
      ),
    );
  }
}

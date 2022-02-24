import 'package:flutter/material.dart';
import '../../../core/router/router.dart';
import '../../login/login_view.dart';

class LoginRow extends StatelessWidget {
  const LoginRow({
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
              child: const Text('already have an account?'),
              padding: const EdgeInsets.symmetric(vertical: 8)),
          GestureDetector(
            onTap: () => MagicRouter.navigateAndPopAll(const LoginView()),
            child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(' Login',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
        ],
      ),
    );
  }
}

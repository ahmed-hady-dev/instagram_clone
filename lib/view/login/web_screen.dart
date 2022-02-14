import 'package:flutter/material.dart';

class LoginWeb extends StatelessWidget {
  const LoginWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text('LoginWeb'),
              Text(MediaQuery.of(context).size.width.toString()),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoTheme(
          data:
              CupertinoTheme.of(context).copyWith(brightness: Brightness.dark),
          child: const CupertinoActivityIndicator()),
    );
  }
}

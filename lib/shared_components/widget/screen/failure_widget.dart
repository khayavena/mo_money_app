import 'package:flutter/cupertino.dart';

class FailureWidget extends StatelessWidget {
  final String message;

  const FailureWidget(
      {Key key = const Key('failureWidget'),
      this.message = 'Something went wrong'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}

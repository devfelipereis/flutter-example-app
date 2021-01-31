import 'package:flutter/material.dart';

class DefaultError extends StatelessWidget {
  final String error;

  const DefaultError(this.error);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}

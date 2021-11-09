import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer(
      {Key? key, required this.isLoaded, required this.child})
      : super(key: key);

  final bool isLoaded;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      return child;
    }
    return Stack(
      children: [
        child,
        Opacity(
          opacity: 0.2,
          child: Container(
            color: Colors.black,
          ),
        ),
        const Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}

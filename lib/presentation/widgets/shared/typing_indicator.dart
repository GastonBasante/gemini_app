import 'package:flutter/material.dart';

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  TypingIndicatorState createState() => TypingIndicatorState();
}

class TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final value = (index * 0.2 + _controller.value) % 1;
            return Opacity(
              opacity: (value < 0.5) ? 1.0 : 0.3,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: CircleAvatar(radius: 4, backgroundColor: Colors.black54),
              ),
            );
          },
        );
      }),
    );
  }
}

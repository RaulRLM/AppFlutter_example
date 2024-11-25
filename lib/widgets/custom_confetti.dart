import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CustomConfetti extends StatelessWidget {
  final ConfettiController confettiController;
  final bool shouldLoop;

  const CustomConfetti({
    Key? key,
    required this.confettiController,
    required this.shouldLoop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: confettiController,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: shouldLoop,
      colors: const [Colors.blue, Colors.purple, Colors.pink],
    );
  }
}

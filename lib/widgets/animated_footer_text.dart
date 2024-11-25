import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedFooterText extends StatelessWidget {
  const AnimatedFooterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText(
            "¡Disfruta del video!",
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          FadeAnimatedText(
            "Raül Lama Martorell",
            textStyle: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        repeatForever: true,
      ),
    );
  }
}

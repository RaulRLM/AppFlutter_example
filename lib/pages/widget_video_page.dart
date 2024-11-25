import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:confetti/confetti.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Importa AnimatedTextKit
import '../widgets/custom_animated_text.dart'; // Importa el widget de texto animado
import '../widgets/custom_confetti.dart'; // Importa el widget de confeti
import '../widgets/animated_footer_text.dart'; // Importa el widget del pie de página

class VideoPage extends StatefulWidget {
  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  late ConfettiController _confettiController;
  bool _isConfettiLooping = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/Testnet.mp4',
    )..initialize().then((_) {
        setState(() {});
      });

    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  void toggleConfetti() {
    setState(() {
      _isConfettiLooping = !_isConfettiLooping;
    });
    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player, Confeti"),
        backgroundColor: const Color(0xFF00C4B4),
      ),
      backgroundColor: const Color(0xFF181A20),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomAnimatedText(text: "Widget VideoPlayer"),
                  const SizedBox(height: 20),
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.replay, color: Colors.white),
                        onPressed: () {
                          _controller.seekTo(Duration.zero);
                          _controller.play();
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.celebration,
                          color: _isConfettiLooping ? Colors.red : Colors.white,
                        ),
                        onPressed: toggleConfetti,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Reemplazamos el AnimatedTextKit con AnimatedFooterText
                  const AnimatedFooterText(), // Aquí se coloca el pie de página animado
                ],
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 200,
            right: 0,
            child: CustomConfetti(
              confettiController: _confettiController,
              shouldLoop: _isConfettiLooping,
            ),
          ),
        ],
      ),
    );
  }
}

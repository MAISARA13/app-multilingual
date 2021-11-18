/// Demonstrates playing a one-shot animation on demand

import 'package:flutter/material.dart';
import 'package:learningapp/Services/Firebase.comic.dart';
import 'package:learningapp/learner/model/Comic.models.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rive/rive.dart';

class PlayPauseAnimation extends StatefulWidget {
  const PlayPauseAnimation({Key? key}) : super(key: key);

  @override
  _PlayPauseAnimationState createState() => _PlayPauseAnimationState();
}

class _PlayPauseAnimationState extends State<PlayPauseAnimation> {
  String title = '';

  // Controller for playback
  late RiveAnimationController _controller;

  // Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  changeText(String _title) {
    setState(() {
      title = _title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeb3a60),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(color: black,fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<Comic>(
        stream: alFatihahStreakStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Comic? comic = snapshot.data;

            return Center(
              child: RiveAnimation.network(
                comic!.url,
                controllers: [_controller],
                // Update the play state when the widget's initialized
                onInit: (_) => setState(() {
                  changeText(comic.language);
                }),
              ),
            );
          } else {
            return const Center(child: Text('Loading ...'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

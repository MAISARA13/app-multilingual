/// Demonstrates playing a one-shot animation on demand

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
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
  int pageChanged = 0;
  PageController pageController = PageController();

  // Controller for playback
  late RiveAnimationController _controller;

  // Toggles between play and pause animation states

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
    var titles = [
      "Hi, Lets learn arabic together",
      "Ahlan Wasahalan !",
      "Kaifahaluka ?",
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFfaf5f5),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(color: black, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<Comic>(
        stream: alFatihahStreakStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Comic? comic = snapshot.data;

            return Stack(
              children: [
                Container(
                  height: 1000,
                  padding: const EdgeInsets.only(right: 280.0),
                  child: RiveAnimation.asset(
                    '${comic!.url}',
                    controllers: [_controller],
                    // Update the play state when the widget's initialized
                    onInit: (_) => setState(() {
                      changeText(comic.language);
                    }),
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: PageView(
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() => pageChanged = value);
                        },
                        children: [
                          DelayedDisplay(
                            delay: const Duration(milliseconds: 500),
                            child: Center(
                                child: Container(
                              width: 500,
                              padding:
                                  const EdgeInsets.only(top: 160.0, left: 180),
                              alignment: Alignment.topCenter,
                              child: Text(
                                titles[pageChanged],
                                maxLines: 2,
                                style: const TextStyle(fontSize: 40.0),
                              ),
                            )),
                          ),
                          DelayedDisplay(
                            delay: const Duration(milliseconds: 500),
                            child: Center(
                                child: Container(
                              width: 500,
                              padding:
                                  const EdgeInsets.only(top: 160.0, left: 180),
                              alignment: Alignment.topCenter,
                              child: Text(
                                titles[pageChanged],
                                maxLines: 2,
                                style: const TextStyle(fontSize: 40.0),
                              ),
                            )),
                          ),
                          DelayedDisplay(
                            delay: const Duration(milliseconds: 500),
                            child: Center(
                                child: Container(
                              width: 500,
                              padding:
                                  const EdgeInsets.only(top: 160.0, left: 180),
                              alignment: Alignment.topCenter,
                              child: Text(
                                titles[pageChanged],
                                maxLines: 2,
                                style: const TextStyle(fontSize: 40.0),
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (pageChanged != 0)
                              GestureDetector(
                                onTap: () {
                                  pageChanged = pageChanged - 1;

                                  pageController.animateToPage(pageChanged,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.arrow_back_ios_outlined,
                                        size: 40),
                                    Text('Back',
                                        style: TextStyle(fontSize: 30)),
                                  ],
                                ),
                              ),
                            const Spacer(),
                            if (pageChanged != 3)
                              GestureDetector(
                                onTap: () {
                                  pageChanged = pageChanged + 1;
                                  if (pageChanged >= 3) {
                                    pageChanged = pageChanged - 1;
                                  } else {
                                    pageController.animateToPage(pageChanged,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.linearToEaseOut);
                                  }
                                },
                                child: Row(
                                  children: const [
                                    Text('Next',
                                        style: TextStyle(fontSize: 30)),
                                    Icon(Icons.arrow_forward_ios_outlined,
                                        size: 40),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const Center(child: Text('Loading ...'));
          }
        },
      ),
    );
  }
}

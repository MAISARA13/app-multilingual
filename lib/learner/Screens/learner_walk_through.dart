import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learningapp/learner/Screens/learner_dashboard.dart';
import 'package:learningapp/learner/Screens/learner_login.dart';
import 'package:learningapp/learner/model/LearnerModels.dart';
import 'package:learningapp/learner/utils/LearnerColors.dart';
import 'package:learningapp/learner/utils/LearnerConstant.dart';
import 'package:learningapp/learner/utils/learner_data_generator.dart';
import 'package:learningapp/learner/utils/learner_images.dart';
import 'package:learningapp/learner/utils/learner_strings.dart';
import 'package:learningapp/learner/utils/learner_widget.dart';
import 'package:learningapp/main/utils/AppWidget.dart';
import 'package:learningapp/main/utils/dots_indicator/dots_indicator.dart';

class LearnerWalkThrough extends StatefulWidget {
  static String tag = '/LearnerWalkThrough';

  @override
  _LearnerWalkThroughState createState() => _LearnerWalkThroughState();
}

class _LearnerWalkThroughState extends State<LearnerWalkThrough> {
  int currentIndexPage = 0;
  int? pageLength;
  var titles = ['Welcome', 'Select Course', 'Learn Topics'];
  var subTitles = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text  ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text"
  ];

  List<LearnerWalk>? mList1;

  @override
  void initState() {
    super.initState();
    mList1 = learnerWalkImg();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(learner_layout_background);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: learner_white,
            child: PageView(
              children: const <Widget>[
                WalkThrough(textContent: learner_walk_1),
                // WalkThrough(textContent: learner_walk_2),
                // WalkThrough(textContent: learner_walk_3),
              ],
              onPageChanged: (value) {
                setState(() => currentIndexPage = value);
              },
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: 50,
            top: MediaQuery.of(context).size.height * 0.45,
            // left: MediaQuery.of(context).size.width * 0.35,
            child: Align(
              alignment: Alignment.center,
              child: DotsIndicator(
                  dotsCount: 3,
                  position: currentIndexPage,
                  decorator: const DotsDecorator(
                      color: learner_greyColor,
                      activeColor: learner_colorPrimary)),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(titles[currentIndexPage],
                      style: const TextStyle(
                          fontFamily: fontBold,
                          fontSize: 20,
                          color: learner_textColorPrimary)),
                  const SizedBox(height: 10),
                  Center(
                      child: Text(subTitles[currentIndexPage],
                          style: const TextStyle(
                              fontFamily: fontRegular,
                              fontSize: 18,
                              color: learner_textColorSecondary),
                          textAlign: TextAlign.center)),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.center,
                      child: LearnerButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LearnerDashboard()));
                        },
                        textContent: learner_Get_Started,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    child: const Text("Login",
                        style: TextStyle(
                            fontSize: textSizeMedium,
                            decoration: TextDecoration.underline,
                            color: learner_greyColor)),
                    onTap: () {
                      print("login");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LearnerLogin()));
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String textContent;

  const WalkThrough({Key? key, required this.textContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 480,
      height: MediaQuery.of(context).size.height,
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            Image.asset(learner_walk_BackImg,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) * 0.4),
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) * 0.4,
                alignment: Alignment.center,
                child: Image.asset(
                  textContent,
                  width: 300,
                  height: (MediaQuery.of(context).size.height) * 0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

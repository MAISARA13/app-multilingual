import 'package:flutter/material.dart';
import 'package:learningapp/learner/utils/LearnerColors.dart';
import 'package:learningapp/learner/utils/LearnerConstant.dart';
import 'package:learningapp/main/utils/AppWidget.dart';

class AlFatihahScreen extends StatefulWidget {
  const AlFatihahScreen({Key? key}) : super(key: key);

  @override
  _AlFatihahScreenState createState() => _AlFatihahScreenState();
}

class _AlFatihahScreenState extends State<AlFatihahScreen> {
  @override
  Widget build(BuildContext context) {
    final topView = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            child: text("Al-Fatihah",
                fontFamily: fontBold,
                fontSize: textSizeNormal,
                textColor: learner_textColorPrimary),
          ),
        ),
      ],
    );
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: learner_colorPrimary),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            topView,
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 300,
                height: 70,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Text("Lets learn using Comics"),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }
}

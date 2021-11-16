import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AlFatihahScreen extends StatefulWidget {
  const AlFatihahScreen({Key? key}) : super(key: key);

  @override
  _AlFatihahScreenState createState() => _AlFatihahScreenState();
}

class _AlFatihahScreenState extends State<AlFatihahScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Al-Fatihah",
            style: TextStyle(color: black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: 300,
                  height: 70,
                  child: ElevatedButton(
                      onPressed: (){},
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
        ));
  }
}

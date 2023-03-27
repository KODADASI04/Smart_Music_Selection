import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:weather_icons/weather_icons.dart';

class DatasPage extends StatelessWidget {
  const DatasPage({super.key});

  @override
  Widget build(BuildContext context) {
    double stressValue = Random().nextInt(100) + 10;
    List<String> weatherIconLists = [
      'wi-day-sunny',
      'wi-day-cloudy',
      'wi-day-fog',
      'wi-day-lightning',
      'wi-day-snow'
    ];
    List<String> locations = ["Home", "GYM", "School"];
    List<String> exercises = [
      "Jogging",
      "Running",
      "Cycling",
      "Swimming",
      "Walking"
    ];
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade200,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(),
                Column(
                  children: [
                    const Text(
                      "Health Datas",
                      style: TextStyle(
                        fontFamily: "PermanentMarker",
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: const [
                              Icon(LineariconsFree.sad),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Stress",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: stressValue,
                                ),
                                Image.asset(
                                  'assets/images/caret-down.png',
                                  width: 25,
                                )
                              ],
                            ),
                            Container(
                              width: 110,
                              height: 20,
                              margin: const EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.green, Colors.red],
                                  ),
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: const [
                            Icon(LineariconsFree.heart_pulse),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Heart Rate",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Text((Random().nextInt(110) + 40).toString()),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(LineariconsFree.arrow_down_circle),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Slide Down"),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade200,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(LineariconsFree.arrow_up_circle),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Slide Up"),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Environment Datas",
                      style: TextStyle(
                        fontFamily: "PermanentMarker",
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              const Text(
                                "Weather",
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              BoxedIcon(
                                WeatherIcons.fromString(
                                  weatherIconLists[Random().nextInt(4)],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: const [
                            Icon(LineariconsFree.location_1),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Location",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Text(
                          locations[Random().nextInt(2)],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.model_training),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Exercise",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Text(
                          exercises[Random().nextInt(4)],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

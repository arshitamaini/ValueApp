import 'package:flutter/material.dart';
import 'package:value_app/res/color.dart';

class PlanetCareScreen extends StatefulWidget {
  const PlanetCareScreen({super.key});

  @override
  State<PlanetCareScreen> createState() => _PlanetCareScreenState();
}

class _PlanetCareScreenState extends State<PlanetCareScreen> {
  List taskList = [
    'Plant a tree',
    'Join a cleanup',
    'Cut back on plastic',
    'Clean out a closet'
  ];
  List taskDescription = [
    'While this seems one of the simplest Earth Day project ideas, the act of planting a tree has so many benefits. Youre creating a new habitat for wildlife, helping to clean the air, and replacing resources that have been used.',
    'There are lots of Earth Day activities that involve cleaning up parks, beaches, river and stream banks, and more.',
    'Walk around your home and see what kind of disposable plastics you are using and where they can be replaced with reusable options.',
    'Everyone has some usable items lying around that have been forgotten. Clean out a closet and donate gently used things to local charities to give them new life.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 106.0,
                height: 80.0,
                color: AppColor.primaryColor,
                padding: const EdgeInsets.only(top: 8.0),
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    )),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.only(right: 23.0, top: 8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 2.0,
                        backgroundColor: Colors.white,
                        foregroundColor: AppColor.textColor,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                    child: const Text('Next'),
                  ),
                ),
              )
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: ((context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 106.0,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            border: Border.all(color: AppColor.primaryColor),
                          ),
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              taskList[index],
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        // Semi-Circle
                        Container(
                            height: 56.0,
                            width: 56 / 2,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              border: Border.all(color: AppColor.primaryColor),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                              ),
                            )),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                right: 40.0, left: 14, top: 44.0),
                            color: Colors.black,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  color: Color(0xffE2DCF8),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: false,
                                          onChanged: ((value) {})),
                                      Text(
                                        taskList[index],
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: AppColor.textColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 48.0),
                                    child: Text(
                                      taskDescription[index],
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColor.textColor,
                                          fontWeight: FontWeight.w400),
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                        'assets/images/planet_care_task${index + 1}.png'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  })))
        ],
      ),
    );
  }
}

class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
   // ClipPath(
              //   clipper: CustomHalfCircleClipper(),
              //   child: Container(
              //     height: 55.0,
              //     width: 55.0,
              //     // color: AppColor.primaryColor,
              //     decoration: BoxDecoration(
              //         color: AppColor.primaryColor,
              //         borderRadius: BorderRadius.circular(150.0)),
              //   ),
              // ),
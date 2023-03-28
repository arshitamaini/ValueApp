import 'package:flutter/material.dart';
import 'package:value_app/res/color.dart';

class SewaScreen extends StatefulWidget {
  const SewaScreen({super.key});

  @override
  State<SewaScreen> createState() => _SewaScreenState();
}

class _SewaScreenState extends State<SewaScreen> {
  List taskList = [
    'Help in langar sewa',
    'Help in bartan sewa',
    'Help in jode sewa',
    'Help in jhadu sewa'
  ];
  List taskDescription = [
    'In this child have to cook food for the langar or serve food in the langar at Darbar Sahib.',
    'In this child have to clean the utensils used in langar.',
    'In this child have to keep all the shoes of the sangat in proper manner at Darbar Sahib.',
    'In this child have to clean whole Darbar Sahib with duster or something.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                )),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 23.0),
            child: SizedBox(
              height: 42.0,
              width: 119.0,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 2.0,
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF5846A3),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          side: BorderSide(
                              color: AppColor.primaryColor, width: 0.5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        color: AppColor.primaryColor,
                      ),
                      Text(
                        'Add new',
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )
                    ],
                  )),
            ),
          ),
          const SizedBox(
            height: 35.0,
          ),
          Expanded(
              child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30.0))),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 29, left: 23, right: 23),
                            child: Card(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 22,
                                  horizontal: 31.0,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: false,
                                          onChanged: ((value) {}),
                                          side: const BorderSide(
                                              color: AppColor.primaryColor),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        Text(
                                          taskList[index],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: AppColor.primaryColor,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 48),
                                      child: Text(
                                        taskDescription[index],
                                        overflow: TextOverflow.visible,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: AppColor.textColor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 23.0, vertical: 19.0),
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 34,
                        width: 69,
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
                          child: const Text('Done'),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      )),
    );
  }
}

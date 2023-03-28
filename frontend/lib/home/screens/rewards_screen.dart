import 'package:flutter/material.dart';
import 'package:value_app/res/color.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  // List children = [
  //   ['Ms. Ramanpreet Kaur', 46, 8, 3],
  //   ['Ms. Damanpreet Kaur', 52, 5, 1]
  // ];
  List childInfo = [
    {
      'name': 'Ms. Ramanpreet Kaur',
      'completed': 46,
      'In Progress': 8,
      'Not Started': 3
    },
    {
      'name': 'Ms. Damanpreet Kaur',
      'completed': 52,
      'In Progress': 5,
      'Not Started': 1
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: childInfo.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 36),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: SizedBox(
                  height: 134,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ListTile(
                          title: Text(
                            childInfo[index]['name'],
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.42),
                          ),
                          leading: const CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 26,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            childInfo[index]['completed'].toString(),
                            style: const TextStyle(
                                color: Color(0xffCCCCCC),
                                fontSize: 11.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(childInfo[index]['In Progress'].toString(),
                              style: const TextStyle(
                                  color: Color(0xffCCCCCC),
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w600)),
                          Text(childInfo[index]['Not Started'].toString(),
                              style: const TextStyle(
                                  color: Color(0xffCCCCCC),
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Completed',
                              style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w600)),
                          Text('In Progress',
                              style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w600)),
                          Text('Not Started',
                              style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}

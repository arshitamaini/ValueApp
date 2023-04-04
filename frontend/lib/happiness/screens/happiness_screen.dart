import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/checkbox_bloc/checkbox_bloc.dart';
import 'package:value_app/res/color.dart';

class HappinessScreen extends StatefulWidget {
  const HappinessScreen({super.key});

  @override
  State<HappinessScreen> createState() => _HappinessScreenState();
}

class _HappinessScreenState extends State<HappinessScreen> {
  List taskList = [
    'Have a toy wash',
    'Design Home made thankyou cards',
    'Start a scrapbook',
  ];
  List taskDescription = [
    'Put your child\'s washable toys in a bin and fill two dishpans with warm water, adding soap to one. Demonstrate how to clean off the toys in the soap-water bin and rinse them in the other, then lay them out on a towel to dry. Children love water play, so this chore seems more like fun than work. Sing, "This Is the Way We Wash Our Clothes" as you work together',
    'Put your child\'s washable toys in a bin and fill two dishpans with warm water, adding soap to one. Demonstrate how to clean off the toys in the soap-water bin and rinse them in the other, then lay them out on a towel to dry. Children love water play, so this chore seems more like fun than work. ',
    'To help your child learn to read nonverbal cues, gather up copies of your (or his) favorite magazines and flip through them together. Instead of focusing on the words, study the people in the photos.',
  ];

  List<bool> taskCheckbox = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
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
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 23.0),
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
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              // topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(30.0))),
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: BlocBuilder<CheckboxBloc, CheckboxState>(
                            builder: (context, state) {
                              taskCheckbox = state is CheckboxClickState
                                  ? state.taskCheckList
                                  : taskCheckbox;
                              return ListView.builder(
                                  itemCount: taskList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 31.0, right: 31.0, top: 29.0),
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Checkbox(
                                                  activeColor:
                                                      AppColor.primaryColor,
                                                  value: taskCheckbox[index],
                                                  onChanged: ((value) {
                                                    context
                                                        .read<CheckboxBloc>()
                                                        .add(CheckboxClickEvent(
                                                            taskCheckList:
                                                                taskCheckbox,
                                                            index: index));
                                                  })),
                                              const SizedBox(
                                                width: 9.0,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 12.0,
                                                    ),
                                                    Text(
                                                      taskList[index],
                                                      overflow:
                                                          TextOverflow.visible,
                                                      style: const TextStyle(
                                                          color: AppColor
                                                              .primaryColor,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    const SizedBox(
                                                      height: 8.0,
                                                    ),
                                                    Text(
                                                      taskDescription[index],
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          color: AppColor
                                                              .textColor,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow:
                                                          TextOverflow.visible,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                        Container(
                          height: 45,
                          padding: const EdgeInsets.only(
                            left: 31.0,
                            right: 31.0,
                          ),
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  elevation: 2.0,
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF5846A3),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      side: BorderSide(
                                          color: AppColor.primaryColor,
                                          width: 0.5))),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: AppColor.primaryColor,
                                  ),
                                  Text(
                                    'Add new task',
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  )
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 8.0,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/goodBehaviour/bloc/checkboxBloc/checkbox_bloc.dart';
import 'package:value_app/res/color.dart';

class GoodBehaviourScreen extends StatefulWidget {
  const GoodBehaviourScreen({super.key});

  @override
  State<GoodBehaviourScreen> createState() => _GoodBehaviourScreenState();
}

class _GoodBehaviourScreenState extends State<GoodBehaviourScreen> {
  List taskList = [
    'Feed the stray animals',
    'Help in old age home for 4 hours',
    'Find ways to donate',
    'Plant a vegetable garden'
  ];
  List taskMap = [{'task': 'A','isChecked':false},{'task': 'B','isChecked':false},{'task': 'C','isChecked':false},{'task': 'D','isChecked':false},];
  List<bool> taskCheckbox = [false, false, false, false];
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
                      borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              child: const Text('Next'),
            ),
          ),
          const SizedBox(
            height: 23.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 23, right: 23.0),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0))),
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 31.0, right: 31.0, top: 29.0),
                                child: SizedBox(
                                  height: 131.0,
                                  child: Card(
                                    // elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          BlocBuilder<CheckboxBloc,
                                              CheckboxState>(
                                            builder: (context, state) {
                                              bool isActive = false;
                                              if (state is CheckboxClickState) {
                                                isActive = state.isActive;
                                              }
                                              return Checkbox(
                                                  activeColor:
                                                      AppColor.primaryColor,
                                                  value: isActive,
                                                  onChanged: ((value) {
                                                    context
                                                        .read<CheckboxBloc>()
                                                        .add(CheckboxClickEvent(
                                                            isActive:
                                                                isActive));
                                                  }));
                                            },
                                          ),
                                          const SizedBox(
                                            width: 9.0,
                                          ),
                                          Image(
                                              image: AssetImage(
                                                  'assets/images/good_behaviour_task${index + 1}.png')),
                                          const SizedBox(
                                            width: 9.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              taskList[index],
                                              overflow: TextOverflow.visible,
                                              style: const TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Container(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
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
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

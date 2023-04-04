import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/checkbox_bloc/checkbox_bloc.dart';
import 'package:value_app/res/color.dart';

class PlanetCareScreen extends StatefulWidget {
  const PlanetCareScreen({super.key});

  @override
  State<PlanetCareScreen> createState() => _PlanetCareScreenState();
}

class _PlanetCareScreenState extends State<PlanetCareScreen> {
  List<String> taskList = [
    'Plant a tree',
    'Join a cleanup',
    'Cut back on plastic',
    'Clean out a closet'
  ];
  List<String> taskDescription = [
    'While this seems one of the simplest Earth Day project ideas, the act of planting a tree has so many benefits. Youre creating a new habitat for wildlife, helping to clean the air, and replacing resources that have been used.',
    'There are lots of Earth Day activities that involve cleaning up parks, beaches, river and stream banks, and more.',
    'Walk around your home and see what kind of disposable plastics you are using and where they can be replaced with reusable options.',
    'Everyone has some usable items lying around that have been forgotten. Clean out a closet and donate gently used things to local charities to give them new life.'
  ];
  List<bool> taskCheckbox = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 5,
              height: 80.0,
              color: AppColor.primaryColor,
              padding: const EdgeInsets.only(top: 8.0),
              alignment: Alignment.topLeft,
              child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  )),
            ),
            Expanded(
              child: Column(
                children: [
                  // Next Button Container
                  Container(
                    alignment: Alignment.bottomRight,
                    color: Colors.white,
                    height: 80.0,
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
                  Expanded(
                      child: BlocConsumer<CheckboxBloc, CheckboxState>(
                    listener: (_, state) {},
                    builder: (context, state) {
                      taskCheckbox = state is CheckboxClickState
                          ? state.taskCheckList
                          : taskCheckbox;
                      return ListView.builder(
                          itemCount: taskList.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 9),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                    color: Color(0xffE2DCF8),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                        value: taskCheckbox[index],
                                        onChanged: ((value) {})),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          Text(
                                            taskList[index],
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: AppColor.textColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            taskDescription[index],
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: AppColor.textColor,
                                                fontWeight: FontWeight.w400),
                                            overflow: TextOverflow.visible,
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            child: Image.asset(
                                                'assets/images/planet_care_task${index + 1}.png'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }));
                    },
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

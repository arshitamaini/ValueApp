import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/common_bloc/checkbox_bloc/checkbox_bloc.dart';
import 'package:value_app/planetCare/bloc/fetch_task_bloc/fetch_task_bloc.dart';
import 'package:value_app/planetCare/screens/add_new_task_screen.dart';
import 'package:value_app/res/color.dart';

class PlanetCareScreen extends StatefulWidget {
  const PlanetCareScreen({super.key});

  @override
  State<PlanetCareScreen> createState() => _PlanetCareScreenState();
}

class _PlanetCareScreenState extends State<PlanetCareScreen> {
  List<bool> taskCheckbox = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  void initState() {
    super.initState();
    context.read<FetchPlanetCareTaskBloc>().add(FetchTaskEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
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
                  BlocConsumer<FetchPlanetCareTaskBloc,
                      FetchPlanetCareTaskState>(
                    listener: (context, state) {
                      if (state is ErrorState) {
                        Center(
                          child: Text(
                            state.message,
                            style: const TextStyle(
                                color: AppColor.textColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Colors.white,
                        ));
                      } else if (state is SuccessState) {
                        return Expanded(
                          child: ListView.builder(
                              itemCount: state.planetCareModel.count,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 9),
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: const BoxDecoration(
                                        color: Color(0xffE2DCF8),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BlocBuilder<CheckboxBloc,
                                            CheckboxState>(
                                          builder: (context, checkBoxstate) {
                                            taskCheckbox = checkBoxstate
                                                    is CheckboxClickState
                                                ? checkBoxstate.taskCheckList
                                                : taskCheckbox;
                                            return Checkbox(
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
                                                }));
                                          },
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 15.0,
                                              ),
                                              Text(
                                                state.planetCareModel
                                                    .info![index].taskTitle
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: AppColor.textColor,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                state
                                                    .planetCareModel
                                                    .info![index]
                                                    .taskDescription
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: AppColor.textColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                overflow: TextOverflow.visible,
                                              ),
                                              Container(
                                                alignment:
                                                    Alignment.centerRight,
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
                              })),
                        );
                      } else {
                        return const Center(
                            child: Text(
                          "Something went wrong !!",
                          style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ));
                      }
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 31.0,
                      right: 31.0,
                    ),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NewTaskScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 2.0,
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF5846A3),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                side: BorderSide(
                                    color: AppColor.primaryColor, width: 0.5))),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

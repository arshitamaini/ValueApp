import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/checkbox_bloc/checkbox_bloc.dart';
import 'package:value_app/happiness/bloc/add_new_task_bloc/add_new_task_bloc.dart';
import 'package:value_app/happiness/bloc/fetch_task_bloc/fetch_happiness_task_bloc.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/happiness/screens/add_new_task_screen.dart';

class HappinessScreen extends StatefulWidget {
  const HappinessScreen({super.key});

  @override
  State<HappinessScreen> createState() => _HappinessScreenState();
}

class _HappinessScreenState extends State<HappinessScreen> {
  List<bool> taskCheckbox = [false, false, false, false, false];

  @override
  void initState() {
    context.read<FetchHappinessTaskBloc>().add(FetchTaskEvent());
    super.initState();
  }

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
                            child: BlocConsumer<FetchHappinessTaskBloc,
                                FetchHappinessTaskState>(
                          listener: (context, state) {
                            if (state is ErrorState) {
                              Center(
                                  child: Text(
                                state.message,
                                style: const TextStyle(
                                    color: AppColor.textColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ));
                            }
                          },
                          builder: (context, state) {
                            if (state is SuccessState) {
                              return ListView.builder(
                                  itemCount: state.happinessTaskModel.count,
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
                                              BlocBuilder<CheckboxBloc,
                                                  CheckboxState>(
                                                builder: (context, state) {
                                                  taskCheckbox = state
                                                          is CheckboxClickState
                                                      ? state.taskCheckList
                                                      : taskCheckbox;
                                                  return Checkbox(
                                                      activeColor:
                                                          AppColor.primaryColor,
                                                      value:
                                                          taskCheckbox[index],
                                                      onChanged: ((value) {
                                                        context
                                                            .read<
                                                                CheckboxBloc>()
                                                            .add(CheckboxClickEvent(
                                                                taskCheckList:
                                                                    taskCheckbox,
                                                                index: index));
                                                      }));
                                                },
                                              ),
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
                                                      state
                                                          .happinessTaskModel
                                                          .info![index]
                                                          .taskTitle
                                                          .toString(),
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
                                                      state
                                                          .happinessTaskModel
                                                          .info![index]
                                                          .taskDescription
                                                          .toString(),
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
                            } else if (state is LoadingState) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              ));
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
                        )),
                        Container(
                          height: 45,
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
                                        builder: (context) => BlocProvider(
                                              create: (context) =>
                                                  AddNewTaskBloc(),
                                              child: const AddNewTaskScreen(),
                                            )));
                              },
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/common_bloc/checkbox_bloc/checkbox_bloc.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/sewa/bloc/add_new_task_bloc/add_new_task_bloc.dart';
import 'package:value_app/sewa/bloc/fetch_task_bloc/fetch_task_bloc.dart';
import 'package:value_app/sewa/screens/add_new_task_screen.dart';

class SewaScreen extends StatefulWidget {
  const SewaScreen({super.key});

  @override
  State<SewaScreen> createState() => _SewaScreenState();
}

class _SewaScreenState extends State<SewaScreen> {
  List<bool> taskCheckbox = [
    false,
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
    context.read<FetchSewaTaskBloc>().add(FetchTask());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 23.0),
              child: SizedBox(
                height: 42.0,
                width: 119.0,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (context) => AddNewTaskBloc(),
                                    child: const AddNewTaskScreen(),
                                  )));
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
                Column(
                  children: [
                    BlocConsumer<FetchSewaTaskBloc, FetchSewaTaskState>(
                      listener: (context, state) {
                        if (state is ErrorState) {
                          const Text('Error Occur');
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
                            child: Scrollbar(
                              trackVisibility: true,
                              thumbVisibility: true,
                              thickness: 8,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: state.sewaModel.info!.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 29, left: 23, right: 23),
                                      child: Card(
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
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
                                                  BlocBuilder<CheckboxBloc,
                                                      CheckboxState>(
                                                    builder: (context,
                                                        checkBoxstate) {
                                                      taskCheckbox = checkBoxstate
                                                              is CheckboxClickState
                                                          ? checkBoxstate
                                                              .taskCheckList
                                                          : taskCheckbox;
                                                      return Checkbox(
                                                          activeColor: AppColor
                                                              .primaryColor,
                                                          value: taskCheckbox[
                                                              index],
                                                          onChanged: ((value) {
                                                            context
                                                                .read<
                                                                    CheckboxBloc>()
                                                                .add(CheckboxClickEvent(
                                                                    taskCheckList:
                                                                        taskCheckbox,
                                                                    index:
                                                                        index));
                                                          }));
                                                    },
                                                  ),
                                                  Text(
                                                    state.sewaModel.info![index]
                                                        .taskTitle
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: AppColor
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 48),
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    state.sewaModel.info![index]
                                                        .taskDescription
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.visible,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            AppColor.textColor,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                            ),
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
                      height: 65,
                      padding: const EdgeInsets.only(
                        left: 31.0,
                        right: 31.0,
                      ),
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 2.0,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  side: BorderSide(
                                      color: AppColor.textColor, width: 0.5))),
                          child: const Text(
                            'Done',
                            style: TextStyle(
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          )),
                    ),
                  ],
                )
              ],
            ))
          ],
        )),
      ),
    );
  }
}

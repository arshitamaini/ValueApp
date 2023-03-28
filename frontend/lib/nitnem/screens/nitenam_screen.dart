import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/nitnem/bloc/path_bloc/bloc/path_bloc.dart';
import 'package:value_app/nitnem/bloc/task_bloc/nitnem_bloc.dart';
import 'package:value_app/nitnem/screens/nitenam_path_screen.dart';
import 'package:value_app/res/color.dart';
import 'package:intl/intl.dart';

class NitenamScreen extends StatefulWidget {
  const NitenamScreen({super.key});

  @override
  State<NitenamScreen> createState() => _NitenamScreenState();
}

class _NitenamScreenState extends State<NitenamScreen> {
  List countList = [3, 0, 1, 0, 8, 2, 0, 22];
  List startList = [
    '19-01-2023',
    '',
    '14-01-2023',
    '',
    '19-01-2023',
    '05-01-2023',
    '',
    '07-01-2023'
  ];
  int noOfTasks = 3;
  getCurrentDate() {
    return DateFormat('MMMM dd').format(DateTime.now());
  }

  late final currentDate = getCurrentDate();

  @override
  void initState() {
    context.read<NitnemBloc>().add(FetchNitnemTask());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: BlocConsumer<NitnemBloc, NitnemState>(
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
            } else if (state is ErrorState) {
              return Center(
                  child: Text(
                state.message,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ));
            } else if (state is SuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    alignment: Alignment.center,
                    child: Text(
                      currentDate,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 33.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 42),
                    child: const Text(
                      'Today',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 42),
                    child: Text(
                      '$noOfTasks Tasks',
                      style: const TextStyle(
                          color: Color(0xffDAD6EC),
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  Expanded(
                    flex: 10,
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
                          ListView.builder(
                              itemCount: state.nitnemModel.count,
                              itemBuilder: (context, index) {
                                var count = countList[index];
                                var startDate = startList[index];
                                return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 19.0, vertical: 8.0),
                                    child: GestureDetector(
                                      onTap: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BlocProvider(
                                                      create: (context) =>
                                                          PathBloc(),
                                                      child:
                                                          const NitenamPathScreen(),
                                                    )));
                                      }),
                                      child: Card(
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: SizedBox(
                                          height: 99.0,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 26.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                          state
                                                              .nitnemModel
                                                              .info![index]
                                                              .name!,
                                                          style: const TextStyle(
                                                              color: AppColor
                                                                  .primaryColor,
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                      Text(
                                                        'Count: $count',
                                                        style: const TextStyle(
                                                            fontSize: 10.0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColor
                                                                .textColor),
                                                      ),
                                                      if (startDate != '')
                                                        Text(
                                                            'Start Date : $startDate',
                                                            style: const TextStyle(
                                                                fontSize: 10.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColor
                                                                    .textColor))
                                                    ],
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.play_circle,
                                                  color: Color(0xff59555E),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('Please Try Again Later'));
            }
          },
        ),
      ),
    );
  }
}

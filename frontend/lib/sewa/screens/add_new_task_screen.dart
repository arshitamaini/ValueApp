import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/common_bloc/checkbox_bloc/checkbox_bloc.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';
import 'package:value_app/sewa/bloc/add_new_task_bloc/add_new_task_bloc.dart';
import 'package:value_app/sewa/bloc/fetch_task_bloc/fetch_task_bloc.dart';
import 'package:value_app/sewa/screens/sewa_screen.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'Sewa',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            ),
            BlocListener<AddNewTaskBloc, AddNewTaskState>(
              listener: (context, state) {
                if (state is LoadingNewTaskState) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ErrorNewTaskState) {
                  Center(
                      child: Text(
                    state.message,
                    style: const TextStyle(color: AppColor.textColor),
                  ));
                }
                if (state is SuccessNewTaskState) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MultiBlocProvider(
                                providers: [
                                  BlocProvider(
                                    create: (context) => FetchSewaTaskBloc(),
                                  ),
                                  BlocProvider(
                                    create: (context) => CheckboxBloc(),
                                  ),
                                ],
                                child: const SewaScreen(),
                              )));
                }
              },
              child: Expanded(
                  flex: 9,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 40),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 8.0),
                                child: const Text(
                                  'Title',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color(0xff59555E),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              // Title Textfeild
                              TextFormField(
                                controller: _titleController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter the task title';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Add title Here',
                                  hintStyle: TextStyle(
                                      color: Color(0xffCAC9CC),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffCAC9CC))),
                                ),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 8.0),
                                child: const Text(
                                  'Description',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color(0xff59555E),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              // Image Textfeild
                              TextFormField(
                                controller: _descriptionController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter the task descrotion';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Add description here',
                                  hintStyle: TextStyle(
                                      color: Color(0xffCAC9CC),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffCAC9CC))),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        context.read<AddNewTaskBloc>().add(
                                            AddTaskEvent(
                                                taskTitle:
                                                    _titleController.text,
                                                taskDescription:
                                                    _descriptionController
                                                        .text));
                                      }
                                    },
                                    style: AppStyle.elevatedButtonStyle,
                                    child: const Text('Done'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        )),
      ),
    );
  }
}

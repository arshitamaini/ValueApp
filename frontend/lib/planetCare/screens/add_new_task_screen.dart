import 'package:flutter/material.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  var value1 = 'AM';

  var value2 = 'AM';
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button
              Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Create New Task',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 54.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Title',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0),
                ),
              ),
              // Title TextFeild
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                      hintText: 'Add Here',
                      hintStyle: TextStyle(
                          color: Color(0xffCAC9CC),
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 24.0),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: const Text(
                  'Date',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0),
                ),
              ),
              // date TextFeild
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: TextField(
                  controller: _dateController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      hintText: 'Add Here',
                      hintStyle: TextStyle(
                          color: Color(0xffCAC9CC),
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 44.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 34.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Start Date TextFeild
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Start Time'),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 64,
                                            child: TextField(
                                              controller: _startTimeController,
                                              keyboardType:
                                                  TextInputType.datetime,
                                              decoration: const InputDecoration(
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                    color: Colors.black,
                                                  )),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                            child: DropdownButton(
                                                elevation: 0,
                                                dropdownColor: Colors.white,
                                                value: value1,

                                                // hint: Text(value1),
                                                style: const TextStyle(
                                                    color: AppColor.textColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                items: const [
                                                  DropdownMenuItem(
                                                    value: 'AM',
                                                    child: Text('AM'),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 'PM',
                                                    child: Text('PM'),
                                                  )
                                                ],
                                                onChanged: (value) {
                                                  setState(() {
                                                    value1 = value!.toString();
                                                  });
                                                }),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  // End Date Textfeild
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('End Time'),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 64,
                                            child: TextField(
                                              controller: _endTimeController,
                                              keyboardType:
                                                  TextInputType.datetime,
                                              decoration: const InputDecoration(
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                    color: Colors.black,
                                                  )),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                            child: DropdownButton(
                                                elevation: 0,
                                                dropdownColor: Colors.white,
                                                hint: Text(value2),
                                                style: const TextStyle(
                                                    color: AppColor.textColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                items: const [
                                                  DropdownMenuItem(
                                                    value: 'AM',
                                                    child: Text('AM'),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 'PM',
                                                    child: Text('PM'),
                                                  )
                                                ],
                                                onChanged: (value) {
                                                  setState(() {
                                                    value2 = value.toString();
                                                  });
                                                }),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 56.0,
                            ),
                            const Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xff59555E),
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            // Description Textfeild
                            TextField(
                              controller: _descriptionController,
                              decoration: const InputDecoration(
                                hintText: 'Add Here',
                                hintStyle: TextStyle(
                                    color: Color(0xffCAC9CC),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffCAC9CC))),
                              ),
                            ),
                            const SizedBox(
                              height: 22.0,
                            ),
                            const Text(
                              'Upload Image',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xff59555E),
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            // Image Textfeild
                            TextField(
                              controller: _titleController,
                              decoration: const InputDecoration(
                                hintText: 'Upload Image Here',
                                hintStyle: TextStyle(
                                    color: Color(0xffCAC9CC),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffCAC9CC))),
                              ),
                            ),
                            // Create Task Button
                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: AppStyle.elevatedButtonStyle,
                                    child: const Text('Create Task'),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

class MentalFitnessScreen extends StatefulWidget {
  const MentalFitnessScreen({super.key});

  @override
  State<MentalFitnessScreen> createState() => _MentalFitnessScreenState();
}

class _MentalFitnessScreenState extends State<MentalFitnessScreen> {
  List questionCategory = [
    'Presence & Focus',
    'Mental Energy',
    'Emotional Control',
    'Social Conection'
  ];
  List question = [
    'Did you live in the presence moment yesterday ?',
    'Was you mind fulll of vitality ?',
    'How did you handle strong emotions yesterday ?',
    'Did you treat others well ?'
  ];
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
            Expanded(
              flex: 1,
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
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 41, bottom: 19),
                        child: Row(
                          children: [
                            Image.asset(
                                'assets/images/white_mental_fitness_icon.png'),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text('Mental Fitness',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(30.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 51,
                      ),
                      Text('How was your mental fitness yesterday ?',
                          style: AppStyle.mentalFitnessQuestionStyle),
                      const SizedBox(
                        height: 41.0,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: question.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Text(
                                    questionCategory[index],
                                    style: const TextStyle(
                                        color: AppColor.textColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    question[index],
                                    style: AppStyle.mentalFitnessQuestionStyle,
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  RatingBar.builder(
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        var rating = index + 1;
                                        return Container(
                                          margin: const EdgeInsets.all(4.0),
                                          height: 28.0,
                                          width: 30.0,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 2.0,
                                                  color:
                                                      AppColor.primaryColor)),
                                          child: Center(
                                              child: Text(
                                            rating.toString(),
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          )),
                                        );
                                      },
                                      onRatingUpdate: (rating) {}),
                                  const Divider(
                                    color: Color(0xffE4E4E4),
                                    thickness: 1.5,
                                  )
                                ],
                              );
                            }),
                      ),
                      // Add new task button
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 46, vertical: 19),
                        child: SizedBox(
                          width: double.infinity,
                          height: 51,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                elevation: 2.0,
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF5846A3),
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0)))),
                            child: const Text('Add new question'),
                          ),
                        ),
                      ),
                      // Done button
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 46, vertical: 19),
                        child: SizedBox(
                          width: double.infinity,
                          height: 51,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: AppStyle.elevatedButtonStyle,
                            child: const Text('Done'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}

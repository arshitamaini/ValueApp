import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/nitnem/bloc/path_bloc/bloc/path_bloc.dart';
import 'package:value_app/res/color.dart';

class NitenamPathScreen extends StatefulWidget {
  const NitenamPathScreen({super.key});

  @override
  State<NitenamPathScreen> createState() => _NitenamPathScreenState();
}

class _NitenamPathScreenState extends State<NitenamPathScreen> {
  String selectedLanguage = 'english';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PathBloc, PathState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
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
                        color: AppColor.textColor,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45.0,
                      width: 105.0,
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<PathBloc>().add(LanguageChangeEvent());
                            selectedLanguage = 'gurmukhi';
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            foregroundColor: selectedLanguage == 'gurmukhi' &&
                                    state is LanguageChangeState
                                ? Colors.white
                                : AppColor.primaryColor,
                            backgroundColor: selectedLanguage == 'gurmukhi' &&
                                    state is LanguageChangeState
                                ? AppColor.primaryColor
                                : Colors.white,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700),
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: AppColor.primaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          ),
                          child: const Text('Gurmukhi')),
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    SizedBox(
                      height: 45.0,
                      width: 105.0,
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<PathBloc>().add(LanguageChangeEvent());
                            selectedLanguage = 'hindi';
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            foregroundColor: selectedLanguage == 'hindi' &&
                                    state is LanguageChangeState
                                ? Colors.white
                                : AppColor.primaryColor,
                            backgroundColor: selectedLanguage == 'hindi' &&
                                    state is LanguageChangeState
                                ? AppColor.primaryColor
                                : Colors.white,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700),
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: AppColor.primaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          ),
                          child: const Text('Hindi')),
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    SizedBox(
                      height: 45.0,
                      width: 105.0,
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<PathBloc>().add(LanguageChangeEvent());
                            selectedLanguage = 'english';
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            foregroundColor: selectedLanguage == 'english' &&
                                        state is LanguageChangeState ||
                                    state is PathInitial
                                ? Colors.white
                                : AppColor.primaryColor,
                            backgroundColor: selectedLanguage == 'english' &&
                                        state is LanguageChangeState ||
                                    state is PathInitial
                                ? AppColor.primaryColor
                                : Colors.white,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700),
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: AppColor.primaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          ),
                          child: const Text('English')),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

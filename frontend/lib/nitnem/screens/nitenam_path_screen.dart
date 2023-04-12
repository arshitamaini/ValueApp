import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/nitnem/bloc/path_bloc/bloc/path_bloc.dart';
import 'package:value_app/res/color.dart';

class NitenamPathScreen extends StatefulWidget {
  final String gurmukhiContent;
  final String englishContent;
  final String hindiContent;
  const NitenamPathScreen(
      {super.key,
      required this.englishContent,
      required this.gurmukhiContent,
      required this.hindiContent});

  @override
  State<NitenamPathScreen> createState() => _NitenamPathScreenState();
}

class _NitenamPathScreenState extends State<NitenamPathScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PathBloc, PathState>(
      builder: (context, state) {
        String selectedLanguage =
            state is LanguageChangeState ? state.language : 'gurmukhi';
        String content = state is LanguageChangeState
            ? state.content
            : widget.gurmukhiContent;
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
                            context.read<PathBloc>().add(LanguageChangeEvent(
                                language: 'gurmukhi',
                                content: widget.gurmukhiContent));
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            foregroundColor: selectedLanguage == 'gurmukhi' &&
                                        state is LanguageChangeState ||
                                    state is PathInitial
                                ? Colors.white
                                : AppColor.primaryColor,
                            backgroundColor: selectedLanguage == 'gurmukhi' &&
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
                            context.read<PathBloc>().add(LanguageChangeEvent(
                                content: widget.hindiContent,
                                language: 'hindi'));
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
                            context.read<PathBloc>().add(LanguageChangeEvent(
                                content: widget.englishContent,
                                language: 'english'));
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            foregroundColor: selectedLanguage == 'english' &&
                                    state is LanguageChangeState
                                ? Colors.white
                                : AppColor.primaryColor,
                            backgroundColor: selectedLanguage == 'english' &&
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
                          child: const Text('English')),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColor.textColor),
                      ),
                    ),
                  ),
                )),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

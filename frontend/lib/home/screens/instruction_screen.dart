import 'package:flutter/material.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

class InstructionScreen extends StatefulWidget {
  const InstructionScreen({super.key});

  @override
  State<InstructionScreen> createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Add instruction for your child',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColor.textColor),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: controller,
              maxLines: 7,
              decoration: InputDecoration(
                  hintText: 'Add here',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Color(0xffC7C7C8)))),
            ),
            const SizedBox(
              height: 44.0,
            ),
            SizedBox(
              height: 45.0,
              width: MediaQuery.of(context).size.width / 1.2,
              child: ElevatedButton(
                onPressed: () {},
                style: AppStyle.elevatedButtonStyle,
                child: const Text('Done'),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

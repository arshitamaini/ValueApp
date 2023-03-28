// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Center(
            child: Text(
              'Settings',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textColor),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: 46.33),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFFCCCCCC), width: 2.0))),
            child: ListTile(
              leading: Image.asset('assets/images/language_icon.png'),
              title: Text(
                'Language',
                style: AppStyle.sideMenuTextStyle,
              ),
              onTap: () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 46.33),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFFCCCCCC), width: 2.0))),
            child: ListTile(
              leading: Image.asset('assets/images/font&style_icon.png'),
              title: Text(
                'Font and Style',
                style: AppStyle.sideMenuTextStyle,
              ),
              onTap: () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 46.33),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFFCCCCCC), width: 2.0))),
            child: ListTile(
              leading: Image.asset('assets/images/delete_account_icon.png'),
              title: Text(
                'Delete account',
                style: AppStyle.sideMenuTextStyle,
              ),
              onTap: () {},
            ),
          )
        ],
      )),
    );
  }
}

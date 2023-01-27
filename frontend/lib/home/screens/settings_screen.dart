import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:value_app/res/style.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          const Center(
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF847C7C), width: 2.0))),
            child: ListTile(
              leading:
                  const Icon(FontAwesomeIcons.lock, color: Color(0xFFbD9D9D9)),
              title: Text(
                'Privacy',
                style: AppStyle.homeDrawerStyle,
              ),
              onTap: () {},
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF847C7C), width: 2.0))),
            child: ListTile(
              leading:
                  const Icon(FontAwesomeIcons.globe, color: Color(0xFFbD9D9D9)),
              title: Text(
                'Language',
                style: AppStyle.homeDrawerStyle,
              ),
              onTap: () {},
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF847C7C), width: 2.0))),
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.palette,
                  color: Color(0xFFbD9D9D9)),
              title: Text(
                'Theme',
                style: AppStyle.homeDrawerStyle,
              ),
              onTap: () {},
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF847C7C), width: 2.0))),
            child: ListTile(
              leading:
                  const Icon(FontAwesomeIcons.font, color: Color(0xFFbD9D9D9)),
              title: Text(
                'Font and Style',
                style: AppStyle.homeDrawerStyle,
              ),
              onTap: () {},
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF847C7C), width: 2.0))),
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.userAltSlash,
                  color: Color(0xFFbD9D9D9)),
              title: Text(
                'Delete account',
                style: AppStyle.homeDrawerStyle,
              ),
              onTap: () {},
            ),
          )
        ],
      )),
    );
  }
}

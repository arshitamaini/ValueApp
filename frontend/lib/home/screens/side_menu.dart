import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_app/authentication/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:value_app/authentication/screens/login_screen.dart';
import 'package:value_app/home/screens/new_task_screen.dart';
import 'package:value_app/home/screens/settings_screen.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

class SideMenu extends StatefulWidget {
  const SideMenu(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.emailPhoneNumber});
  final String firstName;
  final String lastName;
  final String emailPhoneNumber;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 2.0, color: Color(0xffCAC9CC)))),
            child: GestureDetector(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 61.0,
                    height: 61.0,
                    decoration: const BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                    // child: Image.asset('assets/images/emptyProfilePic.jpg'),
                  ),
                  const SizedBox(
                    width: 13.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.firstName} ${widget.lastName}',
                        style: const TextStyle(
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0),
                      ),
                      Text(widget.emailPhoneNumber.toString(),
                          style: const TextStyle(
                              color: Color(0xffCAC9CC),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0))
                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: ListTile(
              leading: Image.asset('assets/images/dashboardIcon.png'),
              title: Text('Dashboard', style: AppStyle.sideMenuTextStyle),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewTaskScreen())),
            child: ListTile(
              leading: Image.asset('assets/images/manageTasksIcon.png'),
              title: Text(
                'Manage Tasks',
                style: AppStyle.sideMenuTextStyle,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const SettingsScreen()))),
            child: ListTile(
              leading: Image.asset('assets/images/settingsIcon.png'),
              title: Text(
                'Settings',
                style: AppStyle.sideMenuTextStyle,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.clear();
                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => AuthenticationBloc(),
                                child: const LoginScreen(),
                              )),
                      ModalRoute.withName(LoginScreen.tag));
                },
                child: ListTile(
                  leading: Image.asset('assets/images/logoutIcon.png'),
                  title: Text(
                    'LogOut',
                    style: AppStyle.sideMenuTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

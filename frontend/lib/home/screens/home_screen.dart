import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_app/authentication/screens/login_screen.dart';
import 'package:value_app/goodBehaviour/screens/goodBehaviour_screen.dart';
import 'package:value_app/happiness/screens/happiness_screen.dart';
import 'package:value_app/health/screens/health_screen.dart';
import 'package:value_app/nitenam/screens/nitenam_screen.dart';
import 'package:value_app/planetCare/screens/planetCare_screen.dart';
import 'package:value_app/profile/screens/profile_screen.dart';
import 'package:value_app/home/screens/settings_screen.dart';
import 'package:value_app/res/style.dart';
import 'package:value_app/sewa/screens/sewa_screen.dart';

import '../../profile/bloc/profile_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key,
      required this.name,
      required this.phoneNumber,
      required this.email});
  final String name;
  final String phoneNumber;
  final String email;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<String>? profileImage;
  Future<String> getProfilePic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profileImage').toString();
  }

  @override
  void initState() {
    profileImage = getProfilePic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/homeBg.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 120.0,
          backgroundColor: Colors.transparent,
          title: const Image(
            image: AssetImage('assets/images/homeLogo.png'),
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.black,
            child: Column(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.white))),
                  child: Center(
                    child: GestureDetector(
                      child: ListTile(
                          title: Text(
                            widget.name,
                            style: const TextStyle(fontSize: 28.0),
                          ),
                          subtitle: Text(widget.phoneNumber,
                              style: const TextStyle(fontSize: 20.0)),
                          leading: const CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage(
                                  'assets/images/emptyProfilePic.jpg'))),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen(
                                    email: widget.email,
                                    name: widget.name,
                                    phoneNumber: widget.phoneNumber)));
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: ListTile(
                    leading: const Icon(FontAwesomeIcons.home,
                        color: Color(0xFFbD9D9D9)),
                    // leading: const CircleAvatar(
                    //   radius: 18.0,
                    //   backgroundImage:
                    //       AssetImage('assets/images/dashboardIcon.png'),
                    // ),
                    title: Text('Dashboard', style: AppStyle.homeDrawerStyle),
                  ),
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.tasks,
                      color: Color(0xFFbD9D9D9)),
                  title: Text(
                    'Manage Tasks',
                    style: AppStyle.homeDrawerStyle,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => SettingsScreen()))),
                  child: ListTile(
                    leading: const Icon(FontAwesomeIcons.tools,
                        color: Color(0xFFbD9D9D9)),
                    title: Text(
                      'Settings',
                      style: AppStyle.homeDrawerStyle,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.exclamationCircle,
                      color: Color(0xFFbD9D9D9)),
                  title: Text(
                    'Help',
                    style: AppStyle.homeDrawerStyle,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('name');
                      prefs.remove('email');
                      prefs.remove('phoneNumber');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: ListTile(
                      leading: const Icon(FontAwesomeIcons.signOutAlt,
                          color: Color(0xFFbD9D9D9)),
                      title: Text(
                        'LogOut',
                        style: AppStyle.homeDrawerStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CategoryCard(
                        cardName: 'Nitnem',
                        cardIcon: 'nitenam.png',
                        onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => NitenamScreen()))),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: CategoryCard(
                          cardName: 'Sewa',
                          cardIcon: 'sewa.png',
                          onPress: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SewaScreen())))),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CategoryCard(
                          cardName: 'Happiness',
                          cardIcon: 'happiness.png',
                          onPress: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => HappinessScreen())))),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: CategoryCard(
                          cardName: 'Good Behaviour',
                          cardIcon: 'goodBehaviour.png',
                          onPress: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      GoodBehaviourScreen())))),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CategoryCard(
                        cardName: 'Planet Care',
                        cardIcon: 'planetCare.png',
                        onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PlanetCareScreen()))),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: CategoryCard(
                          cardName: 'Health',
                          cardIcon: 'health.png',
                          onPress: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => HealthScreen())))),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key,
      required this.cardName,
      required this.onPress,
      required this.cardIcon})
      : super(key: key);
  final String cardName;
  final VoidCallback onPress;
  final String cardIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.7,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: const Color(0xFFD9AB68), width: 2.0),
                borderRadius: const BorderRadius.all(Radius.circular(20.0))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/$cardIcon'),
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    cardName,
                    style: const TextStyle(
                        color: Color(0xFFD9AB68),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

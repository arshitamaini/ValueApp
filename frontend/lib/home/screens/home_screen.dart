import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.name, required this.phoneNumber});
  final String name;
  final String phoneNumber;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.white))),
                  child: Center(
                    child: ListTile(
                      title: Text(
                        widget.name,
                        style: const TextStyle(fontSize: 28.0),
                      ),
                      subtitle: Text(widget.phoneNumber,
                          style: const TextStyle(fontSize: 20.0)),
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(FontAwesomeIcons.home),
                  title: Text('Dashboard'),
                ),
                const ListTile(
                  leading: Icon(FontAwesomeIcons.tasks),
                  title: Text('Manage Tasks'),
                ),
                const ListTile(
                  leading: Icon(FontAwesomeIcons.tools),
                  title: Text('Settings'),
                ),
                const ListTile(
                  leading: Icon(FontAwesomeIcons.exclamationCircle),
                  title: Text('Help'),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(child: Container()),
      ),
    );
  }
}

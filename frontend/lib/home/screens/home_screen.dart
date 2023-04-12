import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_app/checkbox_bloc/checkbox_bloc.dart';
import 'package:value_app/goodBehaviour/screens/good_behaviour_screen.dart';
import 'package:value_app/happiness/bloc/fetch_task_bloc/fetch_happiness_task_bloc.dart';
import 'package:value_app/happiness/screens/happiness_screen.dart';
import 'package:value_app/health/screens/health_screen.dart';
import 'package:value_app/home/screens/instruction_screen.dart';
import 'package:value_app/home/screens/rewards_screen.dart';
import 'package:value_app/home/screens/side_menu.dart';
import 'package:value_app/nitnem/bloc/fetch_task_bloc/fetch_nitnem_task_bloc.dart';
import 'package:value_app/nitnem/screens/nitenam_screen.dart';
import 'package:value_app/planetCare/screens/planet_care_screen.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/sewa/bloc/fetch_task_bloc/fetch_task_bloc.dart';
import 'package:value_app/sewa/screens/sewa_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.emailPhoneNumber,
  });
  final String firstName;
  final String lastName;
  final String emailPhoneNumber;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Future<String>? profileImage;
  TabController? _tabController;
  Future<String> getProfilePic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profileImage').toString();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 60.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Image.asset('assets/images/sideMenuButton.png'));
        }),
      ),
      drawer: SideMenu(
          firstName: widget.firstName,
          lastName: widget.lastName,
          emailPhoneNumber: widget.emailPhoneNumber),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.firstName.toString(),
                  style: const TextStyle(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0),
                ),
                const Text('Have a nice day',
                    style: TextStyle(
                        color: Color(0xffCAC9CC),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0))
              ],
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Card(
            elevation: 5.0,
            child: TabBar(
                controller: _tabController,
                indicatorColor: AppColor.primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: AppColor.textColor,
                unselectedLabelColor: const Color(0xffCAC9CC),
                tabs: const [
                  Tab(child: Text('Tasks')),
                  Tab(child: Text('Rewards')),
                  Tab(child: Text('Instruction')),
                ]),
          ),
          const SizedBox(
            height: 38,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBarView(controller: _tabController, children: [
                Column(
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
                                      builder: ((context) => BlocProvider(
                                            create: ((context) =>
                                                FetchNitnemTaskBloc()),
                                            child: const NitenamScreen(),
                                          )))),
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
                                        builder: ((context) => BlocProvider(
                                              create: (context) =>
                                                  FetchSewaTaskBloc(),
                                              child: const SewaScreen(),
                                            ))))),
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
                                        builder: ((context) =>
                                            MultiBlocProvider(
                                              providers: [
                                                BlocProvider(
                                                  create: (context) =>
                                                      CheckboxBloc(),
                                                ),
                                                BlocProvider(
                                                  create: (context) =>
                                                      FetchHappinessTaskBloc(),
                                                ),
                                              ],
                                              child: const HappinessScreen(),
                                            ))))),
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
                                        builder: ((context) => BlocProvider(
                                              create: (context) =>
                                                  CheckboxBloc(),
                                              child:
                                                  const GoodBehaviourScreen(),
                                            ))))),
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
                                      builder: ((context) => BlocProvider(
                                            create: (context) => CheckboxBloc(),
                                            child: const PlanetCareScreen(),
                                          )))),
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
                                        builder: ((context) =>
                                            const HealthScreen())))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const RewardsScreen(),
                const InstructionScreen()
              ]),
            ),
          ),
        ],
      )),
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
      width: 136,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                // color: Colors.black,
                image: const DecorationImage(
                    image: AssetImage('assets/images/tileBg.png'),
                    fit: BoxFit.cover),
                border: Border.all(color: const Color(0xffEAEDFD), width: 2.0),
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
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

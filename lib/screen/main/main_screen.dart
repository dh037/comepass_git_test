import 'package:comepass/components/custom_bottom_nav.dart';
import 'package:comepass/components/custom_floating_action_button.dart';
import 'package:comepass/notifier/main/bottom_nav_notifier.dart';
import 'package:comepass/notifier/main/main_home_notifier.dart';
import 'package:comepass/screen/main/main_home_screen.dart';
import 'package:comepass/screen/main/main_shop_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifier/main/main_shop_list_notifier.dart';


class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late BottomNavNotifier _bottomNavNotifier;
  final controller = PageController(viewportFraction: 0.9);

  late List<Ticket> ticketList;

  @override
  void initState() {
    super.initState();
    _bottomNavNotifier = context.read<BottomNavNotifier>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNav(
        bottomNavNotifier: _bottomNavNotifier,
      ),
      body: content(context),
    );
  }

  content(BuildContext context) {
    return Consumer<BottomNavNotifier>(
        builder: (BuildContext context, value, Widget? child) => IndexedStack(
              index: _bottomNavNotifier.bottomNavCurrentIndex,
              children: [
                Navigator(
                    key: _bottomNavNotifier.home,
                    onGenerateRoute: (routeSetting) => MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                            create: (_) => MainHomeNotifier(),
                            child: const MainHomeScreen()))),
                Navigator(
                    key: _bottomNavNotifier.shopList,
                    onGenerateRoute: (routeSetting) => MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                            create: (_) => MainShopListNotifier(),
                            child: const MainShopListScreen()))),
                Container(child: Text("2")),
                const SizedBox.shrink(),
                Container(child: Text("3")),
                Container(child: Text("4")),
              ],
            ));
  }

}


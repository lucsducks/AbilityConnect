import 'package:abilityconnect/controllers/menu_app_controller.dart';
import 'package:abilityconnect/responsive.dart';
import 'package:abilityconnect/screens/screens.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isExpanded = false;

  void updateMenuState(bool expanded) {
    setState(() {
      isExpanded = expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(
        onExpandChanged: updateMenuState,
        isExpandedInitial: false,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: isExpanded ? 250 : 100,
                child: SideMenu(
                  onExpandChanged: updateMenuState,
                  isExpandedInitial: isExpanded,
                ),
              ),
            Expanded(
              flex: isExpanded ? 4 : 6,
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}

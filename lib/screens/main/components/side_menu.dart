import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final Function(bool) onExpandChanged;
  final bool isExpandedInitial;

  const SideMenu({
    Key? key,
    required this.onExpandChanged,
    required this.isExpandedInitial,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late bool isExpanded;
  bool showExpandButton = false;
  String selectedMenuItem = 'Dashboard';

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpandedInitial;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => showExpandButton = true),
      onExit: (_) => setState(() => showExpandButton = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: isExpanded ? 250 : 100,
        child: Drawer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: isExpanded ? 250 : 100,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.colorScheme.secondary),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                          widget.onExpandChanged(isExpanded);
                        });
                      },
                      child: Icon(
                        isExpanded ? Icons.chevron_left : Icons.chevron_right,
                        color: colors.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
              DrawerHeader(
                child: Image.asset(
                  "assets/images/logo2.png",
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    DrawerListTile(
                      title: "Dashboard",
                      svgSrc: "assets/icons/menu_dashboard.svg",
                      isExpanded: isExpanded,
                      isEnabled: selectedMenuItem == 'Dashboard',
                      press: () {
                        setState(() {
                          selectedMenuItem = 'Dashboard';
                        });
                        context.go('/home');
                      },
                    ),
                    DrawerListTile(
                      title: "Documentos",
                      svgSrc: "assets/icons/menu_tran.svg",
                      isExpanded: isExpanded,
                      isEnabled: selectedMenuItem == 'Documentos',
                      press: () {
                        setState(() {
                          selectedMenuItem = 'Documentos';
                        });
                        context.go('/home/document');
                      },
                    ),
                    DrawerListTile(
                      title: "Bolsa de trabajo",
                      svgSrc: "assets/icons/menu_task.svg",
                      isExpanded: isExpanded,
                      isEnabled: selectedMenuItem == 'jobboard',
                      press: () {
                        setState(() {
                          selectedMenuItem = 'jobboard';
                          context.go('/home/job-board');
                        });
                      },
                    ),
                    DrawerListTile(
                      title: "Módulos de Capacitación",
                      svgSrc: "assets/icons/menu_store.svg",
                      isExpanded: isExpanded,
                      isEnabled: selectedMenuItem == 'module',
                      press: () {
                        setState(() {
                          selectedMenuItem = 'module';
                          context.go('/home/module');
                        });
                      },
                    ),
                    DrawerListTile(
                      title: "Notification",
                      svgSrc: "assets/icons/menu_notification.svg",
                      isExpanded: isExpanded,
                      isEnabled: selectedMenuItem == 'Notification',
                      press: () {
                        setState(() {
                          selectedMenuItem = 'Notification';
                        });
                      },
                    ),
                    DrawerListTile(
                      title: "Profile",
                      svgSrc: "assets/icons/menu_profile.svg",
                      isExpanded: isExpanded,
                      isEnabled: selectedMenuItem == 'Profile',
                      press: () {
                        setState(() {
                          selectedMenuItem = 'Profile';
                        });
                      },
                    ),
                    DrawerListTile(
                      title: "Settings",
                      svgSrc: "assets/icons/menu_setting.svg",
                      isExpanded: isExpanded,
                      isEnabled: selectedMenuItem == 'Settings',
                      press: () {
                        setState(() {
                          selectedMenuItem = 'Settings';
                        });
                      },
                    ),
                    DrawerListTile(
                      title: "Cerrar sesión",
                      svgSrc: "assets/icons/exit.svg",
                      isExpanded: isExpanded,
                      isEnabled: selectedMenuItem == 'Exit',
                      press: () {
                        context.go('/');
                        setState(() {
                          selectedMenuItem = 'Exit';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.isExpanded,
    this.isEnabled = false,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isExpanded;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final color =
        isEnabled ? colors.onSurface : colors.onSurface.withOpacity(0.5);

    if (!isExpanded) {
      return Container(
        height: 50,
        child: Center(
          child: IconButton(
            icon: SvgPicture.asset(
              svgSrc,
              colorFilter: ColorFilter.mode(
                color,
                BlendMode.srcIn,
              ),
              height: 24,
            ),
            onPressed: press,
          ),
        ),
      );
    }

    return ListTile(
      onTap: press,
      horizontalTitleGap: 20.0,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
        height: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          // Modo escritorio
          return _buildDesktopAppBar(context, colors);
        } else {
          // Modo móvil
          return _buildMobileAppBar(context, colors);
        }
      },
    );
  }

  AppBar _buildDesktopAppBar(BuildContext context, ThemeData colors) {
    return AppBar(
      //! aqui stamos jugando con esto, tenemos que cambiar
      leading: Container(),
      backgroundColor: colors.colorScheme.onError,
      elevation: 0,
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo2.png',
            height: 40,
          ),
          SizedBox(width: 8),
          Text(
            'AbilityConnect',
            style: TextStyle(
              color: colors.primaryColor,
              fontSize: 24,
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNavItem('Inicio', context),
            _buildNavItem('Quienes somos', context),
            SizedBox(width: 20),
            OutlinedButton(
              onPressed: () {
                context.go('/');
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: colors.scaffoldBackgroundColor,
                side: BorderSide(color: colors.primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Iniciar sesión',
                style: TextStyle(color: colors.primaryColor),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                context.push('/register');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Registrarse'),
            ),
            SizedBox(width: 16),
          ],
        ),
      ],
    );
  }

  AppBar _buildMobileAppBar(BuildContext context, ThemeData colors) {
    return AppBar(
      backgroundColor: colors.colorScheme.surface,
      elevation: 0,
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 40,
          ),
          SizedBox(width: 8),
          Text(
            'AbilityConnect',
            style: TextStyle(
              color: colors.primaryColor,
              fontSize: 24,
            ),
          ),
        ],
      ),
      actions: [
        PopupMenuButton<String>(
          icon: Icon(Icons.menu, color: colors.primaryColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onSelected: (value) {
            if (value == 'inicio') {
            } else if (value == 'quienes_somos') {
            } else if (value == 'iniciar_sesion') {
              context.go('/');
            } else if (value == 'registrarse') {
              context.push('/register');
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'inicio',
              child:
                  Text('Inicio', style: TextStyle(color: colors.primaryColor)),
            ),
            PopupMenuItem(
              value: 'quienes_somos',
              child: Text('Quienes somos',
                  style: TextStyle(color: colors.primaryColor)),
            ),
            PopupMenuItem(
              value: 'iniciar_sesion',
              child: Text('Iniciar sesión',
                  style: TextStyle(color: colors.primaryColor)),
            ),
            PopupMenuItem(
              value: 'registrarse',
              child: Text('Registrarse',
                  style: TextStyle(color: colors.primaryColor)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavItem(String text, BuildContext context,
      {bool isMobile = false}) {
    final colors = Theme.of(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: isMobile ? 0 : 12.0, vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          color: colors.colorScheme.secondary,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

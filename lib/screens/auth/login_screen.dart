import 'package:abilityconnect/responsive.dart';
import 'package:abilityconnect/screens/screens.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: buildMobileView(),
        desktop: buildDesktopView(),
      ),
    );
  }

  Widget buildMobileView() {
    return Column(
      children: [
        CustomHeader(),
        SizedBox(height: 100),
        Center(
          child: buildFormContainer(),
        ),
      ],
    );
  }

  Widget buildDesktopView() {
    final colors = Theme.of(context);
    return Column(
      children: [
        CustomHeader(),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: colors.scaffoldBackgroundColor,
                child: Center(
                  child: Image.asset('assets/images/fondo_auth.png',
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(child: buildFormContainer()),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildFormContainer() {
    final colors = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width < 600
          ? double.infinity
          : MediaQuery.of(context).size.width * 0.35,
      padding: const EdgeInsets.all(24.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: colors.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colors.colorScheme.secondary.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: buildForm(),
    );
  }

  Widget buildForm() {
    final colors = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Iniciar Sesión',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: colors.primaryColor,
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: 'Usuario',
            hintText: 'Ingrese su usuario',
            labelStyle: TextStyle(color: Colors.grey[700]),
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: colors.primaryColor, width: 2.0),
            ),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          obscureText: !showPassword,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            hintText: 'Ingrese su contraseña',
            labelStyle: TextStyle(color: Colors.grey[700]),
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: colors.primaryColor, width: 2.0),
            ),
            suffixIcon: IconButton(
              icon:
                  Icon(showPassword ? Icons.visibility_off : Icons.visibility),
              onPressed: () => setState(() => showPassword = !showPassword),
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () {
              context.go('/home');
            },
            child: Text('Iniciar Sesión'),
          ),
        ),
        SizedBox(height: 20),
        TextButton(
          onPressed: () {},
          child: Text(
            '¿Olvidaste tu contraseña? Recupérala aquí',
            style: TextStyle(color: colors.primaryColor),
          ),
        ),
      ],
    );
  }
}

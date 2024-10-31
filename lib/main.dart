import 'package:abilityconnect/constants.dart';
import 'package:abilityconnect/controllers/menu_app_controller.dart';
import 'package:abilityconnect/screens/common/pomodoro_timer_screen.dart';
import 'package:abilityconnect/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuAppController()),
        ChangeNotifierProvider(create: (_) => VisualModeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VisualModeProvider>(
      builder: (context, visualModeProvider, child) {
        return MaterialApp.router(
          title: 'AbilityConnect',
          debugShowCheckedModeBanner: false,
          theme: _getThemeData(visualModeProvider.mode),
          routerConfig: _router,
        );
      },
    );
  }

  ThemeData _getThemeData(VisualMode mode) {
    switch (mode) {
      case VisualMode.highContrast:
        return ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color(0xFFFFD700),
          scaffoldBackgroundColor: Color(0xFF000000),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFD700),
              foregroundColor: Colors.black,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.amber,
            brightness: Brightness.dark,
          ).copyWith(
            secondary: Colors.white,
            surface: Color(0xFF000000),
          ),
        );
      case VisualMode.colorBlind:
        return ThemeData(
          brightness: Brightness.light,
          primaryColor: daltonicPrimaryColor,
          scaffoldBackgroundColor: daltonicBackground,
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: daltonicPrimaryColor),
            bodyMedium: TextStyle(color: daltonicPrimaryColor),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: daltonicButtonFocus,
              foregroundColor: Colors.white,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
          ).copyWith(
            secondary: daltonicHighlight,
            surface: daltonicBackground,
          ),
        );
      default:
        return ThemeData(
          brightness: Brightness.light,
          primaryColor: primaryColor,
          scaffoldBackgroundColor: bgColor,
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: secondaryColor),
            bodyMedium: TextStyle(color: secondaryColor),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
          ).copyWith(
            secondary: secondaryColor,
            surface: bgColor,
          ),
        );
    }
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: AppScaffold(child: LoginScreen()),
          );
        },
      ),
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: AppScaffold(child: RegisterScreen()),
          );
        },
      ),
      ShellRoute(
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            child: AppScaffold(child: MainScreen(child: child)),
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) => NoTransitionPage(
              child: DashboardScreen(),
            ),
            routes: [
              GoRoute(
                path: 'document',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: DocumentWritingScreen(),
                  );
                },
              ),
              GoRoute(
                path: 'job-board',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: JobBoardScreen(),
                  );
                },
              ),
              GoRoute(
                path: 'module',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: ModuleScreen(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class AppScaffold extends StatelessWidget {
  final Widget child;
  const AppScaffold({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          VisualModeSelector(),
          PomodoroTimerButton(),
        ],
      ),
    );
  }
}

class PomodoroTimerButton extends StatelessWidget {
  const PomodoroTimerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                width: 300,
                height: 400,
                padding: EdgeInsets.all(16),
                child: PomodoroTimer(),
              ),
            );
          },
        );
      },
      child: Icon(Icons.timer),
      tooltip: 'Temporizador Pomodoro',
    );
  }
}

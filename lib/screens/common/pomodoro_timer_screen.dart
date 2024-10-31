import 'package:abilityconnect/responsive.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({Key? key}) : super(key: key);

  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  static const int workDuration = 25 * 60; // 25 minutos en segundos
  int _timeLeft = workDuration;
  bool _isRunning = false;
  Timer? _timer;
  @override
  void dispose() {
    _timer?.cancel(); // Cancelar el temporizador en dispose()
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        // Verificar si el State todavía está en el árbol de widgets
        setState(() {
          if (_timeLeft > 0) {
            _timeLeft--;
          } else {
            _timer?.cancel();
            _isRunning = false;
            _showFullScreenModal();
          }
        });
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _timer?.cancel();
      _timeLeft = workDuration;
      _isRunning = false;
    });
  }

  void _stopTimer() {
    setState(() {
      _timer?.cancel();
      _timeLeft = workDuration;
      _isRunning = false;
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _showFullScreenModal() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: Responsive(
            mobile: _buildModalContent(context, isMobile: true),
            desktop: _buildModalContent(context, isMobile: false),
          ),
        );
      },
    );
  }

  Widget _buildModalContent(BuildContext context, {required bool isMobile}) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color: theme.colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.timer_off,
            size: isMobile ? 80 : 120,
            color: theme.colorScheme.primary,
          ),
          SizedBox(height: 24),
          Text(
            '¿Deseas tomar un descanso?',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _resetTimer();
                },
                child: Text('Aceptar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _startTimer();
                },
                child: Text('Declinar'),
                style: OutlinedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Aquí implementarías la lógica para desactivar por 2 horas
                },
                child: Text('Desactivar por 2 horas'),
                style: TextButton.styleFrom(
                  backgroundColor: theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: _isRunning,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _formatTime(_timeLeft),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _isRunning ? null : _startTimer,
                child: Text(_isRunning ? 'En progreso' : 'Iniciar'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isRunning ? _stopTimer : null,
                child: Text('Terminar'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:abilityconnect/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VisualModeSelector extends StatefulWidget {
  const VisualModeSelector({Key? key}) : super(key: key);

  @override
  _VisualModeSelectorState createState() => _VisualModeSelectorState();
}

class _VisualModeSelectorState extends State<VisualModeSelector> {
  bool isExpanded = false;
  double fabY = 200;
  bool isDragging = false;
  late double minOffset;
  late double maxOffset;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenHeight = MediaQuery.of(context).size.height;
      const fabHeight = 56.0;
      const offsetLimit = 120.0;

      minOffset = -(screenHeight / 2) + offsetLimit;
      maxOffset = (screenHeight / 2) - fabHeight - offsetLimit;
    });
  }

  void toggleExpansion() {
    if (!isDragging) {
      setState(() {
        isExpanded = !isExpanded;
      });
    }
  }

  void startDrag(DragStartDetails details) {
    setState(() {
      isDragging = true;
    });
  }

  void updateFabPosition(DragUpdateDetails details) {
    setState(() {
      double newPosition = fabY + details.delta.dy;
      if (newPosition < minOffset) {
        fabY = minOffset;
      } else if (newPosition > maxOffset) {
        fabY = maxOffset;
      } else {
        fabY = newPosition;
      }
    });
  }

  void endFabDrag(DragEndDetails details) {
    setState(() {
      isDragging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final visualModeProvider = Provider.of<VisualModeProvider>(context);
    final visualMode = visualModeProvider.mode;
    final colors = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: Align(
        alignment: Alignment.centerRight,
        child: Transform.translate(
          offset: Offset(0, fabY),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onPanStart: startDrag,
                onPanUpdate: updateFabPosition,
                onPanEnd: endFabDrag,
                child: FloatingActionButton(
                  onPressed: toggleExpansion,
                  child: Icon(isExpanded ? Icons.close : Icons.color_lens),
                  backgroundColor: colors.primaryColor,
                ),
              ),
              if (isExpanded)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 4)
                    ],
                  ),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.wb_sunny,
                            color: visualMode == VisualMode.normal
                                ? colors.primaryColor
                                : Colors.grey),
                        onPressed: () =>
                            visualModeProvider.setVisualMode(VisualMode.normal),
                      ),
                      IconButton(
                        icon: Icon(Icons.brightness_3,
                            color: visualMode == VisualMode.highContrast
                                ? colors.primaryColor
                                : Colors.grey),
                        onPressed: () => visualModeProvider
                            .setVisualMode(VisualMode.highContrast),
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

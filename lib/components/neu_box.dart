import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  final double? padding;

  const NeuBox({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    // is dark mode
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // darker shadow on bottom right
          BoxShadow(
            color: isDarkMode ? Colors.black : Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(4, 3),
          ),

          // lighter shadow on top left
          BoxShadow(
            color: isDarkMode
                ? const Color.fromARGB(255, 44, 43, 43)
                : Colors.white,
            blurRadius: 15,
            offset: const Offset(-3, -3),
          ),
        ],
      ),
      padding: EdgeInsets.all(padding ?? 12),
      child: Center(child: child),
    );
  }
}

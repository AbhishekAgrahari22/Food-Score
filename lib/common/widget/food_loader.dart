import 'package:flutter/material.dart';

class FruitCutleryLoader extends StatefulWidget {
  const FruitCutleryLoader({super.key});

  @override
  State<FruitCutleryLoader> createState() => _FruitCutleryLoaderState();
}

class _FruitCutleryLoaderState extends State<FruitCutleryLoader>
    with TickerProviderStateMixin {
  late AnimationController _bounceController;
  late AnimationController _rotateController;

  @override
  void initState() {
    super.initState();

    // Bounce for fruits
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    // Rotation for cutlery
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _bounceController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Rotating cutlery
          RotationTransition(
            turns: _rotateController,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.restaurant, color: Colors.orange, size: 40),
                SizedBox(width: 80),
                Icon(Icons.rice_bowl, color: Colors.green, size: 40),
              ],
            ),
          ),

          // Bouncing fruits
          ScaleTransition(
            scale: Tween(begin: 0.8, end: 1.2).animate(
              CurvedAnimation(
                parent: _bounceController,
                curve: Curves.easeInOut,
              ),
            ),
            child: const Text("🍎🍊🍌", style: TextStyle(fontSize: 36)),
          ),
        ],
      ),
    );
  }
}

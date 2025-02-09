import 'package:flutter/material.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/widgets/game_components.dart';

class AnimatedFrog extends StatefulWidget {
  final Position targetPosition;
  final Position initialPosition;

  const AnimatedFrog({
    super.key,
    required this.targetPosition,
    required this.initialPosition,
  });

  @override
  State<AnimatedFrog> createState() => _AnimatedFrogState();
}

class _AnimatedFrogState extends State<AnimatedFrog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _xAnimation;
  late Animation<double> _yAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _updateAnimations();
  }

  void _updateAnimations() {
    _xAnimation = Tween<double>(
      begin: widget.initialPosition.x,
      end: widget.targetPosition.x,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _yAnimation = Tween<double>(
      begin: widget.initialPosition.y,
      end: widget.targetPosition.y,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: _xAnimation.value,
          top: _yAnimation.value,
          child: const Frog(),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

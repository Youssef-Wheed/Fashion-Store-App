import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimationLine extends StatelessWidget {
  const AnimationLine({super.key, required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, animation.value, animation.value],
              colors: const [Colors.black, Colors.black, Colors.transparent],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: SvgPicture.asset(
            'assets/logo/line.svg',
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            width: 120, // Explicit width for better visibility
          ),
        );
      },
    );
  }
}

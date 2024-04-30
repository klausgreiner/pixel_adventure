import 'dart:async';

import 'package:flame/components.dart';

import '../pixel_adventure.dart';

enum PlayerState { idle, run, jump }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<PixelAdventure> {
  Player({super.position, required this.character});

  String character;
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runAnimation;
  late final SpriteAnimation jumpAnimation;
  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    idleAnimation = _spriteAnimation(
        'Main Characters/$character/Idle (32x32).png', stepTime, 11);

    runAnimation = _spriteAnimation(
        'Main Characters/$character/Run (32x32).png', stepTime, 12);

    jumpAnimation = _spriteAnimation(
        'Main Characters/$character/Jump (32x32).png', stepTime, 1);
    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.run: runAnimation,
      PlayerState.jump: jumpAnimation,
    };
    current = PlayerState.idle;
  }

  SpriteAnimation _spriteAnimation(
      String animationName, double stepTime, int amount) {
    return SpriteAnimation.fromFrameData(
      gameRef.images.fromCache(animationName),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: Vector2(32, 32),
      ),
    );
  }
}

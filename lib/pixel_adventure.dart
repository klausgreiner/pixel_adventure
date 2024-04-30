import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/components.dart';

import 'levels/level.dart';

class PixelAdventure extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  @override
  final world = Level();

  @override
  Future<void> onLoad() async {
    camera = CameraComponent.withFixedResolution(width: 640, height: 360);
    camera.viewfinder.anchor = Anchor.topLeft;
    addAll([camera, world]);
    return super.onLoad();
  }
}

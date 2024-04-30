import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:pixel_adventure/actors/player.dart';

class Level extends World {
  late TiledComponent level;
  late Player player;

  @override
  FutureOr onLoad() async {
    level = await TiledComponent.load('Level-01.tmx', Vector2.all(16.0));
    final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>('SpawnPoints');
    for (final spawnPoint in spawnPointsLayer?.objects ?? []) {
      switch (spawnPoint.class_) {
        case 'Player':
          player = Player(
              character: 'Ninja Frog',
              position: Vector2(spawnPoint.x, spawnPoint.y));
          add(player);
          break;
      }
    }
    add(level);

    return super.onLoad();
  }
}

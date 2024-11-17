import '../core/models/player_model.dart';
import '../shared/app_constants.dart';

abstract class IGameService {
  PlayerModel get player;
  set player(PlayerModel value);
}

class GameService implements IGameService {
  PlayerModel _player = AppConstants.defaultPlayer;
  @override
  PlayerModel get player => _player;
  @override
  set player(PlayerModel value) => _player = value;
}

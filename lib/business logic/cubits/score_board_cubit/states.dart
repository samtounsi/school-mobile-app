import 'package:mobile_schoolapp/data/models/score_board_model.dart';

abstract class ScoreBoardStates {}
class ScoreBoardInitialState extends ScoreBoardStates{}
class ScoreBoardLoadingState extends ScoreBoardStates{}
class ScoreBoardSuccessState extends ScoreBoardStates
{
  final ScoreBoardModel scoreBoardModel;

  ScoreBoardSuccessState(this.scoreBoardModel);
}
class ScoreBoardErrorState extends ScoreBoardStates
{
  final String error;

  ScoreBoardErrorState(this.error);
}
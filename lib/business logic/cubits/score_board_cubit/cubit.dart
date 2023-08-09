
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/score_board_cubit/states.dart';
import 'package:mobile_schoolapp/data/models/score_board_model.dart';
import '../../../presentation/components and constants/constants.dart';
import '../../../presentation/components and constants/constants.dart';
import 'package:http/http.dart' as http;

class ScoreBoardCubit extends Cubit<ScoreBoardStates>
{
  ScoreBoardCubit():super(ScoreBoardInitialState());
  static ScoreBoardCubit get(context) => BlocProvider.of(context);
  ScoreBoardModel? scoreBoardModel;
  Future getScoreBoard({quizId})async
  {
    emit(ScoreBoardLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/mob/get_scoreboard'));
    request.fields.addAll({
      'quiz_id': quizId.toString()
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200)
    {
        scoreBoardModel=ScoreBoardModel.fromJson(jsonDecode(await response.stream.bytesToString()));
        emit(ScoreBoardSuccessState(scoreBoardModel!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(response.statusCode);
      print(error);
      emit(ScoreBoardErrorState(error));
    }

  }


}
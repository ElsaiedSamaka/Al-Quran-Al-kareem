import 'package:alquranMobile/repositories/QuranDetailRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:alquranMobile/models/QuranDetailModel.dart';

part 'qurandetail_state.dart';

class QurandetailCubit extends Cubit<QurandetailState> {
  final QuranDetailRepository repository;
  
  QurandetailCubit({ this.repository }) : super(InitialState());

  Future<void> getQuranDetail(String surahId, String ayatCount) async {
    try {
      emit(LoadingState());
      final quranDetail = await repository.getQuranDetail(surahId, ayatCount);
      emit(LoadedState(quranDetail));
    } catch (e) {
      emit(ErrorState());
    }
  }
}

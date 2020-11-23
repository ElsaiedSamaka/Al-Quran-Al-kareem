import 'package:alquranMobile/models/QuranListModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:alquranMobile/repositories/QuranListRepository.dart';

part 'quranlist_state.dart';

class QuranlistCubit extends Cubit<QuranlistState> {
  final QuranListRepository repository;

  QuranlistCubit({ this.repository }) : super(InitialState());

  Future<void> getQuranList() async {
    try {
      emit(LoadingState());
      final quranList = await repository.getQuranList();
      emit(LoadedState(quranList));
    } catch (e) {
      emit(ErrorState());
    }
  }

}

part of 'quranlist_cubit.dart';

@immutable
abstract class QuranlistState extends Equatable {}

class InitialState extends QuranlistState {
  @override
  List<Object> get props => [];
}

class LoadingState extends QuranlistState {
  @override
  List<Object> get props => [];
}

class LoadedState extends QuranlistState {
  LoadedState(this.quranList);

  final List<QuranListModel> quranList;

  @override
  List<Object> get props => [quranList];
}

class ErrorState extends QuranlistState {
  @override
  List<Object> get props => [];
}

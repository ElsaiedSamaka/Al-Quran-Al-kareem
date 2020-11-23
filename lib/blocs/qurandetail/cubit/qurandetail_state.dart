part of 'qurandetail_cubit.dart';

@immutable
abstract class QurandetailState extends Equatable{}

class InitialState extends QurandetailState {
  @override
  List<Object> get props => [];
}

class LoadingState extends QurandetailState {
  @override
  List<Object> get props => [];
}

class LoadedState extends QurandetailState {
  LoadedState(this.quranDetail);

  final List<QuranDetailModel> quranDetail;

  @override
  List<Object> get props => [quranDetail];
}

class ErrorState extends QurandetailState {
  @override
  List<Object> get props => [];
}

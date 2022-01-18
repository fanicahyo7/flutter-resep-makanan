part of 'resepcategorylist_bloc.dart';

@immutable
abstract class ResepcategorylistState {
  const ResepcategorylistState();
}

class ResepcategorylistInitial extends ResepcategorylistState {}

class ResepcategoryListLoading extends ResepcategorylistState {}

class ResepcategoryListFailed extends ResepcategorylistState {
  final String error;
  const ResepcategoryListFailed(this.error);
}

class ResepcategoryListLoaded extends ResepcategorylistState {
  final ResepListModel list;
  const ResepcategoryListLoaded(this.list);
}

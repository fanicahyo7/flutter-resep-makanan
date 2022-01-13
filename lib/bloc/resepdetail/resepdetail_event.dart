part of 'resepdetail_bloc.dart';

@immutable
abstract class ResepdetailEvent {}

class FetchResepDetail extends ResepdetailEvent {
  final String key;

  FetchResepDetail(this.key);
}

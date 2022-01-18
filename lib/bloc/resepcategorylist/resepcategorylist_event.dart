part of 'resepcategorylist_bloc.dart';

@immutable
abstract class ResepcategorylistEvent {}

class FetchResepByCategory extends ResepcategorylistEvent {
  final String key;

  FetchResepByCategory(this.key);
}
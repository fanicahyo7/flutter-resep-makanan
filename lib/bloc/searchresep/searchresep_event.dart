part of 'searchresep_bloc.dart';

@immutable
abstract class SearchresepEvent {
  const SearchresepEvent();
}

class SearchResep extends SearchresepEvent {
  final String key;

  const SearchResep(this.key);
}

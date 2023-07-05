part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeEventLoading extends HomeEvent {
  final int page;

  HomeEventLoading(this.page);
}

// class HomeLoadMore extends HomeEvent {
//   final int page;

//   HomeLoadMore(this.page);
// }

part of 'wish_list_cubit.dart';

@immutable
sealed class WishListState {}

final class WishListInitial extends WishListState {}

final class WishlistInitial extends WishListState {}

final class WishListLoading extends WishListState {}

final class WishListLoaded extends WishListState {}

final class WishListError extends WishListState {
  final String message;

  WishListError(this.message);
}

final class WishListProductDeleted extends WishListState {}

final class WishListProductAdded extends WishListState {}

final class WishListProductUpdated extends WishListState {}

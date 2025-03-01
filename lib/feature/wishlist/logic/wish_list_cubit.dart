
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/db/local_db/wishList_db_helper.dart';
import '../data/model/wishList_model.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());
  double totalPrice = 0;
  List<ProductWishListModel> products = [];
  Future<void> getWishListData() async {
    emit(WishListLoading());
    try {
      await WishlistSQLHelper.get().then((value) {
        products = value.map((e) => ProductWishListModel.fromJson(e)).toList();
      });
      calculateTotalPrice();
      emit(WishListLoaded());
    } catch (e) {
      emit(WishListError(e.toString()));
    }
  }

  Future<void> deleteProduct(String id, int index) async {
    emit(WishListLoading());
    try {
      await WishlistSQLHelper.delete(id);
      products.removeAt(index);
      calculateTotalPrice();

      emit(WishListProductDeleted());
    } catch (e) {
      emit(WishListError(e.toString()));
    }
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    for (int i = 0; i < products.length; i++) {
      totalPrice += products[i].quantity! * products[i].price!.toDouble();
    }
  }
}

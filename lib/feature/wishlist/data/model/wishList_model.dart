class ProductWishListModel {
  String? id;
  String? title;
  num? price;
  String? description;
  String? image;
  int? quantity;

  ProductWishListModel(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.image,
        this.quantity});

  ProductWishListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    quantity = json['quantity'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] =description;
    data['category'] = quantity;
    data['image'] = image;

    return data;
  }
}

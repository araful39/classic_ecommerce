class OngoingOrderDetailsModel {
  String? status;
  String? message;
  OngoingView? ongoingView;

  OngoingOrderDetailsModel({this.status, this.message, this.ongoingView});

  OngoingOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    ongoingView = json['ongoing_view'] != null
        ? OngoingView.fromJson(json['ongoing_view'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (ongoingView != null) {
      data['ongoing_view'] = ongoingView!.toJson();
    }
    return data;
  }
}

class OngoingView {
  int? id;
  String? shippingName;
  String? shippingEmail;
  String? shippingPhone;
  String? shippingAddress;
  List<ProductData>? productData;
  String? totalAmount;
  String? deliveryCharge;
  String? status;

  OngoingView(
      {this.id,
        this.shippingName,
        this.shippingEmail,
        this.shippingPhone,
        this.shippingAddress,
        this.productData,
        this.totalAmount,
        this.deliveryCharge,
        this.status});

  OngoingView.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shippingName = json['shipping_name'];
    shippingEmail = json['shipping_email'];
    shippingPhone = json['shipping_phone'];
    shippingAddress = json['shipping_address'];
    if (json['product_data'] != null) {
      productData = <ProductData>[];
      json['product_data'].forEach((v) {
        productData!.add(ProductData.fromJson(v));
      });
    }
    totalAmount = json['total_amount'];
    deliveryCharge = json['delivery_charge'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shipping_name'] = shippingName;
    data['shipping_email'] = shippingEmail;
    data['shipping_phone'] = shippingPhone;
    data['shipping_address'] = shippingAddress;
    if (productData != null) {
      data['product_data'] = productData!.map((v) => v.toJson()).toList();
    }
    data['total_amount'] = totalAmount;
    data['delivery_charge'] = deliveryCharge;
    data['status'] = status;
    return data;
  }
}

class ProductData {
  String? productName;
  int? quantity;
  int? price;
  String? image;

  ProductData({this.productName, this.quantity, this.price, this.image});

  ProductData.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    quantity = json['quantity'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['quantity'] = quantity;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}

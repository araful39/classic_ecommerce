class DeliveredOrderDetailsModel {
  String? status;
  String? message;
  DeliveryView? deliveryView;

  DeliveredOrderDetailsModel({this.status, this.message, this.deliveryView});

  DeliveredOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    deliveryView = json['delivery_view'] != null
        ? DeliveryView.fromJson(json['delivery_view'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (deliveryView != null) {
      data['delivery_view'] = deliveryView!.toJson();
    }
    return data;
  }
}

class DeliveryView {
  String? orderNo;
  String? orderDate;
  String? userName;
  String? shippingName;
  String? shippingEmail;
  String? shippingPhone;
  String? shippingAddress;
  List<ProductData>? productData;
  String? paymentMethod;
  String? totalAmount;
  String? deliveryCharge;
  String? status;

  DeliveryView(
      {this.orderNo,
        this.orderDate,
        this.userName,
        this.shippingName,
        this.shippingEmail,
        this.shippingPhone,
        this.shippingAddress,
        this.productData,
        this.paymentMethod,
        this.totalAmount,
        this.deliveryCharge,
        this.status});

  DeliveryView.fromJson(Map<String, dynamic> json) {
    orderNo = json['order_no'];
    orderDate = json['order_date'];
    userName = json['user_name'];
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
    paymentMethod = json['payment_method'];
    totalAmount = json['total_amount'];
    deliveryCharge = json['delivery_charge'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_no'] = orderNo;
    data['order_date'] = orderDate;
    data['user_name'] = userName;
    data['shipping_name'] = shippingName;
    data['shipping_email'] = shippingEmail;
    data['shipping_phone'] = shippingPhone;
    data['shipping_address'] = shippingAddress;
    if (productData != null) {
      data['product_data'] = productData!.map((v) => v.toJson()).toList();
    }
    data['payment_method'] = paymentMethod;
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

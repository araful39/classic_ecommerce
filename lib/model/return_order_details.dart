class ReturnOrderDetailsModel {
  String? status;
  String? message;
  ReturnView? returnView;

  ReturnOrderDetailsModel({this.status, this.message, this.returnView});

  ReturnOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    returnView = json['return_view'] != null
        ? ReturnView.fromJson(json['return_view'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (returnView != null) {
      data['return_view'] = returnView!.toJson();
    }
    return data;
  }
}

class ReturnView {
  String? orderNo;
  String? orderDate;
  String? returnDate;
  String? returnReason;
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

  ReturnView(
      {this.orderNo,
        this.orderDate,
        this.returnDate,
        this.returnReason,
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

  ReturnView.fromJson(Map<String, dynamic> json) {
    orderNo = json['order_no'];
    orderDate = json['order_date'];
    returnDate = json['return_date'];
    returnReason = json['return_reason'];
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
    data['return_date'] = returnDate;
    data['return_reason'] = returnReason;
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

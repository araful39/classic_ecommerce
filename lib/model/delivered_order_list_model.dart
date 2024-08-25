class DeliveredOrderListModel {
  String? status;
  String? message;
  List<DeliveryList>? deliveryList;

  DeliveredOrderListModel({this.status, this.message, this.deliveryList});

  DeliveredOrderListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['delivery_list'] != null) {
      deliveryList = <DeliveryList>[];
      json['delivery_list'].forEach((v) {
        deliveryList!.add(DeliveryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (deliveryList != null) {
      data['delivery_list'] =
          deliveryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryList {
  int? id;
  String? orderNo;
  String? orderDate;
  int? totalQuantity;
  int? totalPrice;
  String? deliveryCharge;
  String? paymentMethod;
  String? image;
  String? deliveryDate;

  DeliveryList(
      {this.id,
        this.orderNo,
        this.orderDate,
        this.totalQuantity,
        this.totalPrice,
        this.deliveryCharge,
        this.paymentMethod,
        this.image,
        this.deliveryDate});

  DeliveryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    orderDate = json['order_date'];
    totalQuantity = json['total_quantity'];
    totalPrice = json['total_price'];
    deliveryCharge = json['delivery_charge'];
    paymentMethod = json['payment_method'];
    image = json['image'];
    deliveryDate = json['delivery_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_no'] = orderNo;
    data['order_date'] = orderDate;
    data['total_quantity'] = totalQuantity;
    data['total_price'] = totalPrice;
    data['delivery_charge'] = deliveryCharge;
    data['payment_method'] = paymentMethod;
    data['image'] = image;
    data['delivery_date'] = deliveryDate;
    return data;
  }
}

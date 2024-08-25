
class ReturnOrderListModel {
  String? status;
  String? message;
  List<ReturnList>? returnList;

  ReturnOrderListModel({this.status, this.message, this.returnList});

  ReturnOrderListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['return_list'] != null) {
      returnList = <ReturnList>[];
      json['return_list'].forEach((v) {
        returnList!.add(ReturnList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (returnList != null) {
      data['return_list'] = returnList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReturnList {
  int? id;
  String? orderNo;
  int? totalPrice;
  String? deliveryCharge;
  String? returnReason;

  ReturnList(
      {this.id,
        this.orderNo,
        this.totalPrice,
        this.deliveryCharge,
        this.returnReason});

  ReturnList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    totalPrice = json['total_price'];
    deliveryCharge = json['delivery_charge'];
    returnReason = json['return_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_no'] = orderNo;
    data['total_price'] = totalPrice;
    data['delivery_charge'] = deliveryCharge;
    data['return_reason'] = returnReason;
    return data;
  }
}

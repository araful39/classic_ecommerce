class OngoingOrderListModel {
  String? status;
  String? message;
  List<OngoingList>? ongoingList;

  OngoingOrderListModel({this.status, this.message, this.ongoingList});

  OngoingOrderListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['ongoing_list'] != null) {
      ongoingList = <OngoingList>[];
      json['ongoing_list'].forEach((v) {
        ongoingList!.add(OngoingList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (ongoingList != null) {
      data['ongoing_list'] = ongoingList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OngoingList {
  int? id;
  String? orderNo;
  dynamic totalAmount;
  dynamic deliveryCharge;
  String? status;
  String? createdAt;

  OngoingList(
      {this.id,
        this.orderNo,
        this.totalAmount,
        this.deliveryCharge,
        this.status,
        this.createdAt});

  OngoingList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    totalAmount = json['total_amount'];
    deliveryCharge = json['delivery_charge'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_no'] = orderNo;
    data['total_amount'] = totalAmount;
    data['delivery_charge'] = deliveryCharge;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}

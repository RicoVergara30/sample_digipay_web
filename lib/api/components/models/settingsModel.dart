class DescriptionVendors {
  String? responseTime;
  String? device;
  String? retCode;
  String? message;
  List<Data>? data;

  DescriptionVendors(
      {this.responseTime, this.device, this.retCode, this.message, this.data});

  DescriptionVendors.fromJson(Map<String, dynamic> json) {
    responseTime = json['responseTime'];
    device = json['device'];
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['responseTime'] = responseTime;
    data['device'] = device;
    data['retCode'] = retCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? vendorCode;
  String? vendorName;
  String? serviceCode;
  String? serviceName;
  String? baseUrl;
  int? port;
  String? endpoint;
  String? method;
  String? description;
  int? serviceType;
  int? status;
  bool? isEnabled;
  String? encodedBy;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.vendorCode,
    this.vendorName,
    this.serviceCode,
    this.serviceName,
    this.baseUrl,
    this.port,
    this.endpoint,
    this.method,
    this.description,
    this.serviceType,
    this.status,
    this.isEnabled,
    this.encodedBy,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorCode = json['vendorCode'];
    vendorName = json['vendorName'];
    serviceCode = json['serviceCode'];
    serviceName = json['serviceName'];
    baseUrl = json['baseUrl'];
    port = json['port'];
    endpoint = json['endpoint'];
    method = json['method'];
    description = json['description'];
    serviceType = json['serviceType'];
    status = json['status'];
    isEnabled = json['isEnabled'];
    encodedBy = json['encodedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vendorCode'] = vendorCode;
    data['vendorName'] = vendorName;
    data['serviceCode'] = serviceCode;
    data['serviceName'] = serviceName;
    data['baseUrl'] = baseUrl;
    data['port'] = port;
    data['endpoint'] = endpoint;
    data['method'] = method;
    data['description'] = description;
    data['serviceType'] = serviceType;
    data['status'] = status;
    data['isEnabled'] = isEnabled;
    data['encodedBy'] = encodedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    return data;
  }
}

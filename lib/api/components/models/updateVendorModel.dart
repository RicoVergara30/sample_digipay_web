class UpdateVendor {
  String? vendorCode;
  String? serviceCode;
  String? encodedBy;
  String? serviceName;
  String? baseUrl;
  int? port;
  String? method;
  String? description;
  bool? isEnabled;
  int? serviceType;
  int? status;

  UpdateVendor(
      {this.vendorCode,
      this.serviceCode,
      this.encodedBy,
      this.serviceName,
      this.baseUrl,
      this.port,
      this.method,
      this.description,
      this.isEnabled,
      this.serviceType,
      this.status});

  UpdateVendor.fromJson(Map<String, dynamic> json) {
    vendorCode = json['vendorCode'];
    serviceCode = json['serviceCode'];
    encodedBy = json['encodedBy'];
    serviceName = json['serviceName'];
    baseUrl = json['baseUrl'];
    port = json['port'];
    method = json['method'];
    description = json['description'];
    isEnabled = json['isEnabled'];
    serviceType = json['serviceType'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendorCode'] = this.vendorCode;
    data['serviceCode'] = this.serviceCode;
    data['encodedBy'] = this.encodedBy;
    data['serviceName'] = this.serviceName;
    data['baseUrl'] = this.baseUrl;
    data['port'] = this.port;
    data['method'] = this.method;
    data['description'] = this.description;
    data['isEnabled'] = this.isEnabled;
    data['serviceType'] = this.serviceType;
    data['status'] = this.status;
    return data;
  }
}

class AuthModel {
  int? status;
  String? message;
  String? object;

  AuthModel({this.status, this.message, this.object});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    object = json['object'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['status'] = status;
  //   data['message'] = message;
  //   data['object'] = object;
  //   return data;
  // }
}

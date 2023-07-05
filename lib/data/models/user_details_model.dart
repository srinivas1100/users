import 'package:track_users/data/models/support_model.dart';
import 'package:track_users/data/models/user_model.dart';

class UsersDetails {
  UserModel? userModel;
  Support? support;

  UsersDetails({this.userModel, this.support});

  UsersDetails.fromJson(Map<String, dynamic> json) {
    userModel = json['data'] != null ? UserModel.fromJson(json['data']) : null;
    support =
        json['support'] != null ? Support.fromJson(json['support']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userModel != null) {
      data['data'] = userModel!.toJson();
    }
    if (support != null) {
      data['support'] = support!.toJson();
    }
    return data;
  }
}

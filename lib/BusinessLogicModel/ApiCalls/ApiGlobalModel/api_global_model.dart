import 'package:recipley_assignment/BusinessLogicModel/Enums/apistatus_anum.dart';
import 'package:recipley_assignment/BusinessLogicModel/Models/AuthenticationModel/login_model.dart';

class ApiResponse<T> {
  int? code;
  String? message;
  ApiStatus? apiStatus;
  T? data;

  ApiResponse(this.message, this.code,this.apiStatus, this.data);
}
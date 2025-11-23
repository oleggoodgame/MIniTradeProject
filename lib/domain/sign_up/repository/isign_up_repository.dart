
import 'package:mini_cash/domain/sign_up/data/repository/request/sign_up_request.dart';
import 'package:mini_cash/domain/sign_up/data/repository/response/sign_up_response.dart';

abstract interface  class ISignUpRepository{
  Future<SignUpResponse> sign_up(SignUpRequest data);
}
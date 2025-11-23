

import 'package:mini_cash/domain/log_in/data/repository/request/log_in_request.dart';
import 'package:mini_cash/domain/log_in/data/repository/response/log_in_response.dart';

abstract interface  class IlogInRepository{
  Future<LogInResponse> log_in(LogInRequest data);
}
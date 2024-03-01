import 'dart:io';

import 'package:http_interceptor/http_interceptor.dart';

class DemoInterceptor extends InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final Map<String, String> headers = Map.from(request.headers);

    headers[HttpHeaders.contentTypeHeader] = "application/json";

    return request.copyWith(
      url: request.url.addParameters({
        'units': 'metric',
      }),
      headers: headers,
    );
  }

  @override
  Future<BaseResponse> interceptResponse(
          {required BaseResponse response}) async =>
      response;
}

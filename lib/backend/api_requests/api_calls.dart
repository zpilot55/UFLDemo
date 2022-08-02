import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetQRCodeCall {
  static Future<ApiCallResponse> call({
    String text = 'test',
    int size = 300,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetQRCode',
      apiUrl:
          'https://v1.slashapi.com/universalfencingleague/qr-code/gfb3eFoQH6',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'text': text,
        'size': size,
      },
      returnBody: true,
    );
  }
}

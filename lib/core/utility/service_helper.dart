import 'package:vexana/vexana.dart';

import '../base/model/base_response_model.dart';

abstract class ServiceHelper {
  R? responseParser<T extends INetworkModel, R>(T model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, dynamic>) as R;
    }
    return data as R?;
  }

  R? errorParser<T, R>(BaseResponseModel model, dynamic data) {
    var dataSp = data.replaceAll('{', '').replaceAll('}', '').split(',');

    var mapData = <String, dynamic>{};
    dataSp.forEach((element) {
      mapData[element.split(':')[0].replaceAll(' ', '')] =
          element.split(':')[0].replaceAll(' ', '') == 'status'
              ? element.split(':')[1].replaceAll(' ', '').toString().parseBool
              : element.split(':')[1];
    });

    return model.fromJson(mapData) as R;
  }
}

extension StringLocalization on String {
  bool get parseBool => toLowerCase() == 'true';
}

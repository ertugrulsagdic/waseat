import 'package:flutter_template/core/base/model/file_model.dart';
import 'package:flutter_template/core/constants/network/network_route_enum.dart';
import 'package:vexana/vexana.dart';

import '../base/model/base_response_model.dart';

abstract class ServiceHelper {
  requestJson(
    INetworkManager manager,
    NetworkRoutes route,
    RequestType method, {
    dynamic dataModel,
    String? token,
  }) async {
    Options? options;
    if (token != null) {
      options = Options(headers: {'Authorization': token});
    }
    // TODO: enctypt data if necessary
    var dataModelJson = dataModel.toJson();
    var response = await manager.send<BaseResponseModel, BaseResponseModel>(
      route.rawValue,
      parseModel: BaseResponseModel(),
      method: method,
      options: options,
      data: dataModelJson,
    );
    // TODO: decrypt response if necessary
    return response;
  }

  requestFormData(
    INetworkManager manager,
    NetworkRoutes route, {
    List<FileModel>? files,
    String? data,
    String? token,
  }) async {
    Options? options;
    if (token != null) {
      options = Options(headers: {
        "Authorization": token,
        "Content-Type": "multipart/form-data"
      });
    } else {
      options = Options(headers: {"Content-Type": "multipart/form-data"});
    }
    var formData = FormData();

    if (data != null) {
      formData = FormData.fromMap({
        data: data,
      });
    }

    if (files != null) {
      if (files.isNotEmpty) {
        formData.files.addAll(
          files.map(
            (FileModel file) => MapEntry(
              'file',
              MultipartFile.fromFileSync(file.path, filename: 'file.filename'),
            ),
          ),
        );
      }
    }

    var response = await manager.send<BaseResponseModel, BaseResponseModel>(
      route.rawValue,
      parseModel: BaseResponseModel(),
      method: RequestType.POST,
      options: options,
      data: formData,
    );

    return response;
  }

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

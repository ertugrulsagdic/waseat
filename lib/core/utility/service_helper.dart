import 'dart:io';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waseat/core/init/lang/language_manager.dart';
import '../init/lang/locale_keys.g.dart';
import 'package:vexana/vexana.dart';

import '../base/model/base_response_model.dart';
import '../base/model/file_model.dart';
import '../constants/enums/preferences_keys_enum.dart';
import '../constants/navigation/navigation_constants.dart';
import '../constants/network/network_route_enum.dart';
import '../init/cache/locale_manager.dart';
import '../init/navigation/navigation_service.dart';

abstract class ServiceHelper {
  requestJson<T extends INetworkModel, R>(
    INetworkManager manager,
    NetworkRoutes route,
    RequestType method, {
    dynamic dataModel,
    bool token = true,
    T? dataParser,
    String? urlSuffix = '',
  }) async {
    Options? options;
    if (token) {
      options = Options(headers: {
        'Authorization':
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiIxIn0.MJDbW9MGmKm6AxwIZ5QNQdKmY4bu8h-G0fm3i6NoLzA'
        // LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
      });
    }
    // TODO: enctypt data if necessary

    dynamic dataModelJson;

    if (dataModel != null) {
      dataModelJson = dataModel.toJson();
    }

    var response = await manager.send<BaseResponseModel, BaseResponseModel>(
      route.rawValue,
      parseModel: BaseResponseModel(),
      method: method,
      options: options,
      data: dataModelJson,
      urlSuffix: urlSuffix,
    );
    // TODO: decrypt response if necessary

    if (response.data is BaseResponseModel) {
      final data = response.data!.data;
      if (dataParser != null && data is List) {
        response.data!.data =
            responseParser<T, List<T>>(dataParser, response.data!.data);
      } else if (dataParser != null && data is Map) {
        response.data!.data =
            responseParser<T, T>(dataParser, response.data!.data);
      }
      return response.data;
    } else {
      if (response.error != null) {
        if (response.error!.statusCode != null) {
          if (response.error!.statusCode == HttpStatus.unauthorized) {
            kickUnauthorized();
            final errorModel =
                errorParser<BaseResponseModel, BaseResponseModel>(
                    BaseResponseModel(), response.error!.response.toString());
            return errorModel;
          } else if (response.error!.statusCode! <
              HttpStatus.internalServerError) {
            final errorModel =
                errorParser<BaseResponseModel, BaseResponseModel>(
                    BaseResponseModel(), response.error!.description);
            return errorModel;
          }
        } else {
          somethingWentWrongPage();
          return BaseResponseModel(
            type: false,
            message: response.error!.description ??
                LocaleKeys.somethingwentwrong.tr(),
          );
        }
      }
    }
  }

  requestFormData<T extends INetworkModel, R>(
    INetworkManager manager,
    NetworkRoutes route, {
    List<FileModel>? files,
    dynamic data,
    bool token = true,
    T? dataParser,
    String? urlSuffix = '',
  }) async {
    Map<String, dynamic> options;
    if (token) {
      options = {
        "Authorization":
            LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN),
        "Content-Type": "multipart/form-data",
      };
    } else {
      options = {"Content-Type": "multipart/form-data"};
    }

    var formData = FormData();

    if (data != null) {
      formData = FormData.fromMap({
        'data': data,
      });
    }

    if (files != null) {
      if (files.isNotEmpty) {
        formData.files.addAll(
          files.map(
            (FileModel file) => MapEntry(
              'file',
              MultipartFile.fromFileSync(file.path, filename: file.filename),
            ),
          ),
        );
      }
    }
    dynamic response;
    ResponseModel result;
    try {
      response = await manager.uploadFile(
          '${route.rawValue}$urlSuffix', formData,
          headers: options);

      final responseStatusCode = response.statusCode ?? HttpStatus.notFound;

      if (responseStatusCode >= HttpStatus.ok &&
          responseStatusCode <= HttpStatus.multipleChoices) {
        final parsedModel =
            responseParser<BaseResponseModel, BaseResponseModel>(
          BaseResponseModel(),
          response.data,
        );

        result = ResponseModel<BaseResponseModel>(data: parsedModel);
      } else if (responseStatusCode == HttpStatus.unauthorized) {
        result = ResponseModel(
            error: ErrorModel(description: response.data.toString()));
      } else {
        result = ResponseModel(
            error: ErrorModel(
          statusCode: responseStatusCode,
          description: response.data.toString(),
        ));
      }
    } on DioError catch (e) {
      final errorResponse = e.response;
      final errorModel = ErrorModel(
        description: e.message,
        statusCode: errorResponse != null
            ? errorResponse.statusCode
            : HttpStatus.internalServerError,
      );
      errorModel.response = errorResponse!.data;
      result = ResponseModel(
        error: errorModel,
      );
    }

    if (result.data is BaseResponseModel) {
      final data = result.data!.data;
      if (dataParser != null && data is List) {
        result.data!.data =
            responseParser<T, List<T>>(dataParser, result.data!.data);
      } else if (dataParser != null && data is Map) {
        result.data!.data = responseParser<T, T>(dataParser, result.data!.data);
      }
      return result.data;
    } else {
      if (result.error != null) {
        if (result.error!.statusCode == HttpStatus.unauthorized) {
          kickUnauthorized();
          final errorModel = errorParser<BaseResponseModel, BaseResponseModel>(
              BaseResponseModel(), result.error!.response.toString());
          return errorModel;
        } else if (result.error!.statusCode! < HttpStatus.internalServerError) {
          final errorModel = errorParser<BaseResponseModel, BaseResponseModel>(
              BaseResponseModel(), result.error!.description);
          return errorModel;
        } else {
          somethingWentWrongPage();
          return BaseResponseModel(
            type: false,
            message: LocaleKeys.somethingwentwrong.tr(),
          );
        }
      }
    }
  }

  void kickUnauthorized() {
    LocaleManager.instance.setStringValue(PreferencesKeys.TOKEN, '');

    NavigationService.instance
        .navigateToPageClear(path: NavigationConstants.DEFAULT);
  }

  void somethingWentWrongPage() {
    LocaleManager.instance.setStringValue(PreferencesKeys.TOKEN, '');

    NavigationService.instance
        .navigateToPageClear(path: NavigationConstants.DEFAULT);
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
          element.split(':')[0].replaceAll(' ', '') == 'type'
              ? element.split(':')[1].replaceAll(' ', '').toString().parseBool
              : element.split(':')[1];
    });

    return model.fromJson(mapData) as R;
  }
}

extension StringLocalization on String {
  bool get parseBool => toLowerCase() == 'true';
}

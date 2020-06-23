import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:study/common/constants.dart';
import 'package:study/utils/common_utils.dart';


class HttpUtils {
  static HttpUtils _instance;

  Dio dio;
  BaseOptions baseOptions;

//  获取实例
  static HttpUtils getInstance() {
    if (null == _instance) _instance = new HttpUtils();
    return _instance;
  }

  /*
   * config it and create
   */
  HttpUtils() {
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    baseOptions = new BaseOptions(
      //请求基地址,可以包含子路径
      baseUrl: Constants.GUYUN_BASE_URL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 30000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 30000,
      sendTimeout: 30000,
      contentType: Headers.jsonContentType,
      //表示期望以那种格式(方式)接受响应数据。接受4种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.json,
      headers: {'x-lc-id':Constants.GUYUN_APPID}
    );

    dio = new Dio(baseOptions);
  }
  /*
   * get请求
   */
  void get(url,
      {
      data,
      cancelToken,
      Function success,
      Function error,
      Function result}) async {
    Response response;
    dio.options.headers = CommonUtils.getHeaders();
    try {
      print('request url--------- $url');
      print('request data--------- $data');
      response =
          await dio.get(url, queryParameters: data, cancelToken: cancelToken);
      print('get success--------- ${response.data}');
      if (result == null)
        _result(response, success, error);
      else
        result(response);
    } on DioError catch (e) {
      print('get error--------- $e');
      error(e.message);
      formatError(e);
    }
  }

  /*
   * delete请求
   */
  void delete(url,
      {
      data,
      cancelToken,
      Function success,
      Function error,
      Function result}) async {
    Response response;
    try {
      print('request url--------- $url');
      print('request data--------- $data');
      response = await dio.delete(url,
          queryParameters: data, cancelToken: cancelToken);
      print('delete success--------- ${response.data}');
      if (result == null)
        _result(response, success, error);
      else
        result(response);
    } on DioError catch (e) {
      print('delete error--------- $e');
      error(e.message);
      formatError(e);
    }
  }

  /*
   * get请求
   */
  void put(url,
      {
      data,
      cancelToken,
      Function success,
      Function error,
      Function result}) async {
    Response response;
    try {
      print('request url--------- $url');
      print('request data--------- $data');
      response = await dio.put(url,
          data: data,
          options: Options(contentType: Headers.formUrlEncodedContentType),
          cancelToken: cancelToken);
      print('put success--------- ${response.data}');
      if (result == null)
        _result(response, success, error);
      else
        result(response);
    } on DioError catch (e) {
      print('put error--------- $e');
      error(e.message);
      formatError(e);
    }
  }

  /*
   * post请求
   */
  void post(url,
      {
      data,
      cancelToken,
      options,
      Function success,
      Function error,
      Function result}) async {
    dio.options.headers = CommonUtils.getHeaders();
    Response response;
    try {
      print('request data----$url----- $data');
      response = await dio.post(url,
          data: data, options: options, cancelToken: cancelToken);
      print('post success--------- ${response.data}');
      if (result == null) {
        _result(response, success, error);
      } else {
        result(response);
      }
      EasyLoading.dismiss();
    } on DioError catch (e) {
      print('post error--------- $e');
      formatError(e);
    }
  }

  /*
   * 下载文件
   */
  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      print('downloadFile url--------- $urlPath');
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
      print('downloadFile success--------- ${response.data}');
    } on DioError catch (e) {
      print('downloadFile error--------- $e');
      formatError(e);
    }
    return response.data;
  }

  ///统一的回调处理
  void _result(Response response, Function success, Function error) {
    success(response.data);
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  /*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }
}

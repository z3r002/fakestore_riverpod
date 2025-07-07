import 'package:fakestore_riverpod/main.dart';
import 'package:fakestore_riverpod/model/product_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  static Future? refreshTokenFuture;
  static bool tokenExpired = false;

  static instance() {
    final dio = Dio();

    dio.interceptors.add(
      InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        // await refreshHandler(options);
        print('PATH: ${options.path} REQUEST: ${options.data}');

        return handler.next(options);
      }, onResponse:
          (Response response, ResponseInterceptorHandler handler) async {
        print(
            'PATH: ${response.requestOptions.path} RESPONSE: ${response.data}');
        return handler.next(response);
      }, onError: (DioException err, ErrorInterceptorHandler handler) async {
        print(
            'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

        // if (err.response?.statusCode == 401 && tokenExpired) {
        //   tokenExpired = false;
        // } else {
        showDialog(
            context: appRouter.navigatorKey.currentState!.context,
            builder: (ctx) => AlertDialog(
              title: Text('Ошибка!'),
              content: Text(err.response!.data['message'].toString()),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(
                          appRouter.navigatorKey.currentState!.context)
                          .pop();
                    },
                    child: Text('ОК'))
              ],
            )).then((value) => handler.next(err));
        // builder: (ctx) => AlertError(
        //     textError: err.response!.data['message'].toString(),
        //     onTap: () {
        //       Navigator.of(appRouter.navigatorKey.currentState!.context)
        //           .pop();
        //     })).then((value) => handler.next(err));
        //  }
      }),
    );

    return ApiClient(dio, baseUrl: 'https://fakestoreapi.com/');
  }

  @GET("products")
  Future<ProductResponse> getProducts();

  // @GET("/v1/mo/{mo_id}/district")
  // Future<GetDistrictResponse> getDistrict(@Path("mo_id") int moId);
  //
  // @GET("/v1/mo/{mo_id}/district/{district}/street")
  // Future<GetStreetsResponse> getStreet(
  //     @Path("mo_id") int moId, @Path("district") String street);
  //
  // @GET("/v1/mo/{mo_id}/district/{district}/street/{street}/house")
  // Future<GetHouseResponse> getHouse(@Path("mo_id") int moId,
  //     @Path("district") String district, @Path("street") String street);
  //
  // @GET("/v1/mo/{mo_id}/district/{district}/street/{street}/house/{house}/flat")
  // Future<GetFlatsResponse> getFlats(
  //     @Path("mo_id") int moId,
  //     @Path("district") String district,
  //     @Path("street") String street,
  //     @Path("house") String house);
  //
  // @GET("/v1/type-values")
  // Future<GetTypeValues> getTypeValues();
  //
  // @POST("/v1/update-gas-status")
  // Future sendGasTrue(@Body() GasTrueRequest request);
  //
  // @POST("/v1/add")
  // Future addAddress(@Body() GasTrueRequest request);
  //
  // @POST("/v1/upload")
  // Future uploadAddress(@Body() UploadAddressRequest request);
  //
  // @POST("/v1/auth/login")
  // Future sendLogin(@Body() RequestLogin request);


}

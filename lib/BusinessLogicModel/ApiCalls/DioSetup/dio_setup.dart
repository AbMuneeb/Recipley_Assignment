import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

class DioSetUp
{
  Dio getDio()
  {
    Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    (client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    //
    // SecurityContext sc = SecurityContext(withTrustedRoots: false);
    // sc.setTrustedCertificatesBytes(LoadCertificates.sslCert1.buffer.asInt8List());
    // //sc.setTrustedCertificatesBytes(LoadCertificates.sslCert2.buffer.asInt8List());
    // // sc.setTrustedCertificatesBytes(LoadCertificates.sslCert3.buffer.asInt8List());
    // //context.setTrustedCertificates(null);
    //
    // // context.setTrustedCertificatesBytes(
    // // rootCACertificate.buffer.asUint8List());
    // //
    // // context
    // //     .useCertificateChainBytes(clientCertificate.buffer.asUint8List());
    // //
    // // context.usePrivateKeyBytes(privateKey.buffer.asUint8List());
    //
    //
    //
    //   HttpClient httpClient = HttpClient(context: sc);
    // httpClient.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => true;
    //
    // return httpClient;
    };
    return dio;
  }
}
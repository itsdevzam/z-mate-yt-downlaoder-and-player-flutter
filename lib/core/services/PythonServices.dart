import 'package:flutter/services.dart';

class PythonServices {
  // static const MethodChannel _channel =
  // MethodChannel('com.yt.down/downloader');
  //
  // static Future<String?> ensureStorageAccess() async {
  //   try {
  //     final result = await _channel.invokeMethod<String?>(
  //       'ensureStorageAccess',
  //     );
  //
  //     return result;
  //   } on PlatformException catch (e) {
  //     print('Storage error: ${e.message}');
  //     return null;
  //   }
  // }
  //
  // static Future<bool> hasStorageAccess() async {
  //   try {
  //     final result = await _channel.invokeMethod<bool>(
  //       'hasStorageAccess',
  //     );
  //
  //     return result ?? false;
  //   } on PlatformException catch (e) {
  //     print('Storage check error: ${e.message}');
  //     return false;
  //   }
  // }
  //
  // static Future<String?> getDownloadDirectory() async {
  //   try {
  //     return await _channel.invokeMethod<String>(
  //       'getDownloadDirectory',
  //     );
  //   } on PlatformException catch (e) {
  //     print('Directory error: ${e.message}');
  //     return null;
  //   }
  // }
  //
  // static Future<bool> downloadAudio({
  //   required String videoId,
  //   required String audioTag,
  // }) async {
  //   try {
  //     final result = await _channel.invokeMethod<String>(
  //       'downloadAudio',
  //       {
  //         'videoId': videoId,
  //         'audioTag': audioTag,
  //       },
  //     );
  //
  //     print('Python result: $result');
  //
  //     return result == 'success';
  //   } on PlatformException catch (e) {
  //     print('Download error: ${e.message}');
  //     return false;
  //   }
  // }
  //
  // static Future<bool> downloadVideo({
  //   required String videoId,
  //   required String videoTag,
  // }) async {
  //   try {
  //     final result = await _channel.invokeMethod<String>(
  //       'downloadVideo',
  //       {
  //         'videoId': videoId,
  //         'videoTag': videoTag,
  //       },
  //     );
  //
  //     print('Python result: $result');
  //
  //     return result == 'success';
  //   } on PlatformException catch (e) {
  //     print('Download error: ${e.message}');
  //     return false;
  //   }
  // }
}
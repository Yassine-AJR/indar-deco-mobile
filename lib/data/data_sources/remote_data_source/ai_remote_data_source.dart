
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:indar_deco/core/errors/exceptions/exceptions.dart';
import 'package:indar_deco/core/utils/api_const.dart';
import 'package:http_parser/http_parser.dart';


abstract class ArtificialIntelligenceRemoteDataSource{
    Future<String> generateDecor(String prompt,File file);
    Future<String> changeColor(String color,File file);
    Future<String> changeStyle(String style,File file);
    Future<List<String>> recommandation(File file);
}

  final dio = Dio(BaseOptions(
  baseUrl: ApiConst.aiBaseUrl,
  contentType: Headers.jsonContentType,
  validateStatus: (int? status) {
    return status != null;
    // return status != null && status >= 200 && status < 300;
  },
));

class ArtificialIntelligenceRemoteDataSourceImpl implements ArtificialIntelligenceRemoteDataSource{
  @override
  Future<String> changeColor(String color, File file) async{
       try {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
        "color":color,
        "image":
            await MultipartFile.fromFile(file.path, filename:fileName,contentType: MediaType("image","jpeg")),
    });

      final res = await dio.post(ApiConst.aiChangeColor, data: formData);
      return res.data;
    } catch (e) {
      throw ServerException(message: 'cannot upload image');
    }
  }

  @override
  Future<String> changeStyle(String style, File file) async{
       try {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
        "style":style,
        "image":
            await MultipartFile.fromFile(file.path, filename:fileName,contentType: MediaType("image","jpeg")),
    });

      final res = await dio.post(ApiConst.aiChangeStyle, data: formData);
      return res.data;
    } catch (e) {
      throw ServerException(message: 'cannot upload image');
    }
  }

  @override
  Future<String> generateDecor(String prompt, File file) async{
       try {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
        "prompt":prompt,
        "image":
            await MultipartFile.fromFile(file.path, filename:fileName,contentType: MediaType("image","jpeg")),
    });

      final res = await dio.post(ApiConst.aiGenerateDecor, data: formData);
      return res.data;
    } catch (e) {
      throw ServerException(message: 'cannot upload image');
    }
  }

  @override
  Future<List<String>> recommandation(File file) async{
       try {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
        "image":
            await MultipartFile.fromFile(file.path, filename:fileName,contentType: MediaType("image","jpeg")),
    });

      final res = await dio.post(ApiConst.aiRecommandation, data: formData);
      return res.data['recommendations'];
    } catch (e) {
      throw ServerException(message: 'cannot upload image');
    }
  }

}
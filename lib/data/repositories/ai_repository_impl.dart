import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:indar_deco/core/errors/exceptions/exceptions.dart';
import 'package:indar_deco/core/errors/failures/failures.dart';
import 'package:indar_deco/data/data_sources/remote_data_source/ai_remote_data_source.dart';
import 'package:indar_deco/domain/repositories/ai_repository.dart';

class ArtificialIntelligenceRepositoryImpl implements ArtificialIntelligenceRepository{
  final ArtificialIntelligenceRemoteDataSource artificialIntelligenceRemoteDataSource;

  ArtificialIntelligenceRepositoryImpl( this.artificialIntelligenceRemoteDataSource);

  @override
  Future<Either<Failure, String>> changeColor({required String color, required File file}) async{
            try {
      final res =await artificialIntelligenceRemoteDataSource.changeColor(color,file);
      return  Right(res);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> changeStyle({required String style, required File file})async {
            try {
      final res =await artificialIntelligenceRemoteDataSource.changeStyle(style,file);
      return  Right(res);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> generateDecor({required String prompt, required File file}) async{
               try {
      final res =await artificialIntelligenceRemoteDataSource.generateDecor(prompt,file);
      return  Right(res);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> recommandation({required File file}) async{
               try {
      final res =await artificialIntelligenceRemoteDataSource.recommandation(file);
      return  Right(res);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:indar_deco/core/errors/failures/failures.dart';
import 'package:indar_deco/domain/repositories/ai_repository.dart';

class AiRecommendationUsecase{
  final ArtificialIntelligenceRepository repository;

  AiRecommendationUsecase(this.repository);

    Future<Either<Failure,List<String>>> call({required File file}) async => await repository.recommandation(file: file);
}
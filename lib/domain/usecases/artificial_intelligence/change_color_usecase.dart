import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:indar_deco/core/errors/failures/failures.dart';
import 'package:indar_deco/domain/repositories/ai_repository.dart';

class AiChangeColorUsecase{
  final ArtificialIntelligenceRepository repository;

  AiChangeColorUsecase(this.repository);

    Future<Either<Failure,String>> call({required String color,required File file}) async => await repository.changeColor(color: color,file: file);
}
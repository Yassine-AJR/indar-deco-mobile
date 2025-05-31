import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:indar_deco/core/errors/failures/failures.dart';
import 'package:indar_deco/domain/repositories/ai_repository.dart';

class AiGenerateDecoreUsecase{
  final ArtificialIntelligenceRepository repository;

  AiGenerateDecoreUsecase(this.repository);

    Future<Either<Failure,String>> call({required String prompt,required File file}) async => await repository.generateDecor(prompt: prompt,file: file);

}
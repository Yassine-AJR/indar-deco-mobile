import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:indar_deco/core/errors/failures/failures.dart';
import 'package:indar_deco/domain/repositories/ai_repository.dart';

class AiChangeStyleUsecase{
  final ArtificialIntelligenceRepository repository;

  AiChangeStyleUsecase(this.repository);

    Future<Either<Failure,String>> call({required String style,required File file}) async => await repository.changeStyle(style: style,file: file);
}
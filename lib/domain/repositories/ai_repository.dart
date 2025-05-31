import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../core/errors/failures/failures.dart';

abstract class ArtificialIntelligenceRepository{
    Future<Either<Failure,String>> generateDecor({required String prompt,required File file});
    Future<Either<Failure,String>> changeColor({required String color,required File file});
    Future<Either<Failure,String>> changeStyle({required String style,required File file});
    Future<Either<Failure,List<String>>> recommandation({required File file});

}
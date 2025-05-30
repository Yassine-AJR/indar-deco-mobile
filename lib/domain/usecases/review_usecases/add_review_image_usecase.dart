import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:indar_deco/domain/repositories/review_repository.dart';

import '../../../core/errors/failures/failures.dart';

class AddReviewImageUsecase {
  final ReviewRepository _repository;

 const AddReviewImageUsecase(this._repository);

  Future<Either<Failure, String>> call({required File file}) async=>
      await _repository.addReviewImage(file: file);
}

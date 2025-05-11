import 'package:flutter/material.dart';

import '../../data/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase(this.authRepository);

  Future<void> execute(String id, String password, BuildContext context) {
    return authRepository.signIn(id, password, password, context);
  }
}

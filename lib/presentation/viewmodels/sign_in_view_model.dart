import 'package:flutter/material.dart';

import '../../domain/usecases/sign_in_use_case.dart';

class SignInViewModel extends ChangeNotifier {
  final SignInUseCase signInUseCase;

  SignInViewModel(this.signInUseCase);

  String? error;

  Future<void> signIn(String id, String password, BuildContext context) async {
    if (id.isEmpty) {
      error = '아이디가 입력되지 않았습니다.';
      notifyListeners();
      return;
    }

    if (password.isEmpty) {
      error = '비밀번호가 입력되지 않았습니다.';
      notifyListeners();
      return;
    }

    try {
      await signInUseCase.execute(id, password, context);
    } catch (e) {
      error = '로그인 중 오류 발생';
      notifyListeners();
    }
  }
}

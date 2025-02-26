import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocket_flutter/models/user/user.dart';
import 'package:pocket_flutter/repositories/auth_repository.dart';
import 'package:pocket_flutter/repositories/mappers/user_mapper.dart';
import 'package:pocket_flutter/services/dtos/user/user_dto.dart';
import 'package:pocketbase/pocketbase.dart';

part 'auth_cubit.freezed.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  late StreamSubscription<User?> _streamSubscription;

  AuthCubit({
    required this.authRepository,
  }) : super(const AuthState.loading()) {
    _streamSubscription = authRepository.user.listen(_onStateChanged);
  }

  @override
  Future<void> close() async {
    await _streamSubscription.cancel();
    return super.close();
  }

  void _onStateChanged(User? user) async {
    if (user == null) {
      emit(const AuthState.notAuthenticated());
    } else {
      emit(AuthState.authenticated(user));
    }
  }

  Future<void> reload() => authRepository.reload();

  Future<void> signOut() async => authRepository.signOut();
}

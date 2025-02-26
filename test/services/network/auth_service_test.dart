import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:pocket_flutter/services/network/auth_service.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:talker/talker.dart';
import 'package:pocket_flutter/services/dtos/user/user_dto.dart';

class MockPocketBase extends Mock implements PocketBase {}

class MockTalker extends Mock implements Talker {}

class MockRecordService extends Mock implements RecordService {}

void main() {
  late AuthServiceImpl authService;
  late MockPocketBase mockPocketBase;
  mockGoogleSignInFactory(scopes) => GoogleSignIn(
        clientId: 'clientId',
        scopes: scopes,
      );
  late MockTalker mockTalker;
  late MockRecordService mockRecordService;

  setUp(() {
    mockPocketBase = MockPocketBase();
    mockTalker = MockTalker();
    mockRecordService = MockRecordService();

    when(mockPocketBase.collection("users")).thenReturn(mockRecordService);

    authService = AuthServiceImpl(
      pb: mockPocketBase,
      googleSignInFactory: mockGoogleSignInFactory,
      logger: mockTalker,
    );
  });

  group('AuthService', () {
    test('signIn', () async {
      final email = 'test@example.com';
      final password = 'password';
      final recordAuth = RecordAuth(token: 'token', record: RecordModel({'id': 'id'}));

      when(mockRecordService.authWithPassword(email, password)).thenAnswer((_) async => recordAuth);

      await authService.signIn(email: email, password: password);

      verify(mockPocketBase.authStore.save(recordAuth.token, recordAuth.record)).called(1);
    });

    test('signUp', () async {
      final userDTO = UserDTO(
          email: 'test@example.com',
          name: 'Test',
          created: DateTime.now(),
          updated: DateTime.now(),
          emailVisibility: true,
          verified: true);

      when(mockRecordService.create(body: userDTO.toJson())).thenAnswer((_) async => RecordModel({'id': 'id'}));

      await authService.signUp(dto: userDTO);

      verify(mockRecordService.create(body: userDTO.toJson())).called(1);
      verify(mockRecordService.requestVerification(userDTO.email)).called(1);
    });

    test('resetPassword', () async {
      final email = 'test@example.com';

      await authService.resetPassword(email);

      verify(mockRecordService.requestPasswordReset(email)).called(1);
    });

    test('signOut', () async {
      await authService.signOut();

      verify(mockPocketBase.authStore.clear()).called(1);
    });

    test('reload', () async {
      final recordAuth = RecordAuth(token: 'token', record: RecordModel({'id': 'id'}));

      when(mockRecordService.authRefresh()).thenAnswer((_) async => recordAuth);

      await authService.reload();

      verify(mockRecordService.authRefresh()).called(1);
    });

    test('sendEmailVerification', () async {
      final email = 'test@example.com';

      await authService.sendEmailVerification(email);

      verify(mockRecordService.requestVerification(email)).called(1);
    });
  });
}

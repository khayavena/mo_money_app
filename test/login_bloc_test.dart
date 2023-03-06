import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mo_money_app/features/login/bloc/get_login_bloc.dart';
import 'package:mo_money_app/features/login/bloc/get_login_event.dart';
import 'package:mo_money_app/features/login/bloc/get_login_state.dart';
import 'package:mo_money_app/features/login/repository/login_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_bloc_test.mocks.dart';

class MockGetLoginBloc extends MockBloc<GetLoginEvent, GetLoginState>
    implements GetLoginBloc {}

@GenerateMocks([LoginRepository])
void main() {
  late MockGetLoginBloc mockGetLoginBloc;
  late MockLoginRepository loginRepository;

  setUp(() {
    mockGetLoginBloc = MockGetLoginBloc();
    loginRepository = MockLoginRepository();
    mockGetLoginBloc.repository = loginRepository;
  });
  //group

  group('GetAllPointrPointsBloc getAllNavigationPoints success and failure',
      () {
    blocTest<GetLoginBloc, GetLoginState>(
      'test  emit login success',
      setUp: () {
        when(loginRepository.registerUser(any)).thenAnswer((_) async => true);
        when(loginRepository.getCurrentUser()).thenAnswer((_) async => null);
      },
      build: () => MockGetLoginBloc(),
      act: (bloc) {
        bloc.add(GetLoginEvent("khayavena", "password"));
      },
      verify: (bloc) {
        loginRepository.registerUser;
        loginRepository.getCurrentUser;
      },
      expect: () => [],
    );
  });
}

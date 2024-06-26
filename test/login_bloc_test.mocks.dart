// Mocks generated by Mockito 5.4.4 from annotations
// in mo_money_app/test/login_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mo_money_app/features/login/model/user.dart' as _i4;
import 'package:mo_money_app/features/login/repository/login_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [LoginRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginRepository extends _i1.Mock implements _i2.LoginRepository {
  MockLoginRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> registerUser(_i4.User? user) => (super.noSuchMethod(
        Invocation.method(
          #registerUser,
          [user],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<_i4.User?> getCurrentUser() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentUser,
          [],
        ),
        returnValue: _i3.Future<_i4.User?>.value(),
      ) as _i3.Future<_i4.User?>);

  @override
  _i3.Future<bool> login() => (super.noSuchMethod(
        Invocation.method(
          #login,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> isLoggedIn() => (super.noSuchMethod(
        Invocation.method(
          #isLoggedIn,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}

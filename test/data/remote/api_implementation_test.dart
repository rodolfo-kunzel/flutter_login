import 'package:dio/dio.dart';
import 'package:flutter_login/core/errors/custom_exceptions.dart';
import 'package:flutter_login/data/dto/user_dto.dart';
import 'package:flutter_login/data/remote/api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([Dio])
import 'api_implementation_test.mocks.dart';

void main() {
  late ApiImplementation api;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    api = ApiImplementation(dio: mockDio);
  });

  group('getUser', () {
    const int userId = 2;
    final Map<String, dynamic> userJson = {
      "data": {
        "id": 2,
        "email": "janet.weaver@reqres.in",
        "first_name": "Janet",
        "last_name": "Weaver",
        "avatar": "https://reqres.in/img/faces/2-image.jpg"
      },
      "support": {
        "url": "https://reqres.in/#support-heading",
        "text":
            "To keep ReqRes free, contributions towards server costs are appreciated!"
      }
    };
    final userDto = UserDto.fromJson(userJson['data']!);

    test('returns UserDto when the call completes successfully', () async {
      when(mockDio.get<Map<String, dynamic>>(any))
          .thenAnswer((_) async => Response(
                data: userJson,
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ));

      final result = await api.getUser(id: userId);

      expect(result, userDto);
    });

    test('throws NetworkException on DioException', () async {
      when(mockDio.get(any)).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.unknown,
      ));

      expect(() => api.getUser(id: userId), throwsA(isA<NetworkException>()));
    });

    test('throws UnknownException on other exceptions', () async {
      when(mockDio.get(any)).thenThrow(Exception('Unknown error'));

      expect(() => api.getUser(id: userId), throwsA(isA<UnknownException>()));
    });
  });

  group('signIn', () {
    const email = 'john@example.com';
    const password = 'password123';
    final responseJson = {'id': '1'};

    test('returns id when the call completes successfully', () async {
      when(mockDio.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => Response(
                data: responseJson,
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ));

      final result = await api.signIn(email: email, password: password);

      expect(result, responseJson['id']);
    });

    test('throws NetworkException on DioException', () async {
      when(mockDio.post(any, data: anyNamed('data'))).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.unknown,
      ));

      expect(() => api.signIn(email: email, password: password),
          throwsA(isA<NetworkException>()));
    });

    test('throws AuthenticationException on other exceptions', () async {
      when(mockDio.post(any, data: anyNamed('data')))
          .thenThrow(Exception('Unknown error'));

      expect(() => api.signIn(email: email, password: password),
          throwsA(isA<AuthenticationException>()));
    });
  });

  group('register', () {
    const email = 'eve.holt@reqres.in';
    const password = 'pistol';
    final responseJson = {'token': 'abcd1234'};

    test('returns token when the call completes successfully', () async {
      when(mockDio.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => Response(
                data: responseJson,
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ));

      final result = await api.register(email: email, password: password);

      expect(result, responseJson['token']);
    });

    test('throws NetworkException on DioException', () async {
      when(mockDio.post(any, data: anyNamed('data'))).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.unknown,
      ));

      expect(() => api.register(email: email, password: password),
          throwsA(isA<NetworkException>()));
    });

    test('throws AuthenticationException on other exceptions', () async {
      when(mockDio.post(any, data: anyNamed('data')))
          .thenThrow(Exception('Unknown error'));

      expect(() => api.register(email: email, password: password),
          throwsA(isA<AuthenticationException>()));
    });
  });

  group('logout', () {
    test('completes successfully', () async {
      when(mockDio.post(any)).thenAnswer((_) async => Response(
            data: null,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      await api.logout();

      verify(mockDio.post(any)).called(1);
    });

    test('throws NetworkException on DioException', () async {
      when(mockDio.post(any)).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.unknown,
      ));

      expect(() => api.logout(), throwsA(isA<NetworkException>()));
    });

    test('throws ServerException on other exceptions', () async {
      when(mockDio.post(any)).thenThrow(Exception('Unknown error'));

      expect(() => api.logout(), throwsA(isA<ServerException>()));
    });
  });
}

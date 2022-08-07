import 'dart:convert';
import 'package:food_delivery/http_service/constants.dart';
import 'package:food_delivery/models/auth.dart';
import 'package:food_delivery/models/user.dart';
import 'package:http/http.dart';

Future<LoginResponse> loginAuth(String email, String password) async {
  LoginResponse resp = const LoginResponse(accessToken: '', refreshToken: '');

  final uri = Uri(
    scheme: scheme,
    host: host,
    port: port,
    path: login,
  );
  print(uri);

  Map<String, String> body = {
    'email': email,
    'password': password,
  };

  try {
    Response res = await post(uri, body: jsonEncode(body));
    if (res.statusCode == 200) {
      final result = jsonDecode(res.body);
      resp = LoginResponse.fromJson(result);
    } else if (res.statusCode == 401) {
      resp = const LoginResponse(accessToken: '401', refreshToken: '401');
    } else {
      throw "Can't authorization!";
    }
  } catch (e) {
    print(e);
  }

  return resp;
}

class SignUpResponse {
  User? user;
  String? errorMessage;

  SignUpResponse({
    this.user,
    this.errorMessage,
  });
}

Future<SignUpResponse> signUpAuth(String name, String email, String password) async {
  SignUpResponse resp = SignUpResponse();

  final uri = Uri(
    scheme: scheme,
    host: host,
    port: port,
    path: signUp,
  );
  print(uri);

  Map<String, String> body = {
    'name': name,
    'email': email,
    'password': password,
  };

  try {
    Response res = await post(uri, body: jsonEncode(body));
    if (res.statusCode == 200) {
      final result = jsonDecode(res.body);
      resp.user = User.fromJson(result);
    } else if (res.statusCode == 400) {
      resp.errorMessage = '400';
    } else if (res.statusCode == 401) {
      resp.errorMessage = '401';
    } else {
      throw "Can't sing up!";
    }
  } catch (e) {
    print(e);
  }

  return resp;
}


Future<User> fetchProfile(String accessToken) async {
  User user = User(id: 0, name: '', email: '');

  final uri = Uri(
    scheme: scheme,
    host: host,
    port: port,
    path: profile,
  );
  print(uri);

  Map<String, String> headers = {
    'Authorization': 'Bearer $accessToken',
  };

  try {
    Response res = await get(uri, headers: headers);
    if (res.statusCode == 200) {
      final result = jsonDecode(res.body);
      user = User.fromJson(result);
    } else {
      throw "Can't get user!";
    }
  } catch (e) {
    print(e);
  }

  return user;
}


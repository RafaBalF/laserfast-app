import 'package:laserfast_app/app/shared/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve retornar email inválido', () async {
    const String s = "";

    final bool result = validateEmail(s);

    expect(result, equals(false));
  });

  test('deve retornar email válido', () async {
    const String s = "email@valido.com";

    final bool result = validateEmail(s);

    expect(result, equals(true));
  });
}

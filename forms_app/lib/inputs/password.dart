import 'package:formz/formz.dart';

enum PasswordError { empty, length }

class Password extends FormzInput<String, PasswordError> {
  const Password.dirty({String value = ''}) : super.dirty(value);

  const Password.pure() : super.pure('');

  String? get errorMessage {
    if (isValid || isPure) return null;

    if ( displayError == PasswordError.empty ) return 'El campo es requerido'; 
    if ( displayError == PasswordError.length ) return 'Mínimo 6 caracteres'; 

    return null;
  }

  @override
  PasswordError? validator(String value) {
    if (value.trim().isEmpty || value.isEmpty) return PasswordError.empty;
    if (value.trim().length < 6) return PasswordError.length;

    return null;
  }
}

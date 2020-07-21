abstract class StringValidator {
  bool isValid(String str);
}

class NonEmptyStrinValidator extends StringValidator {
  @override
  bool isValid(String str) {
    return str.isNotEmpty;
  }
}

class EmailAndPasswordNonEmptyValidator{
  final StringValidator emailValidator = NonEmptyStrinValidator();
  final StringValidator passwordValidator = NonEmptyStrinValidator();
}

class Utils {

  ///Email regexp
  static const String _emailRegex = r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$";

  /// Verifica se a string é um e-mail válido.
  bool isEmailValid(String email){
    return RegExp(_emailRegex).hasMatch(email);
  }

  /// Verifica se é im link válido
  bool isLinkValid(String link){
    return !Uri.parse(link).isAbsolute;
  }

  /// Compara se as senhas são iguais
  bool comparePasswords({required String firstPassword,required String secondPassword}){
    return(firstPassword == secondPassword) ? true:false;
  }

}
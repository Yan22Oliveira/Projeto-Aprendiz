import 'package:brasil_fields/brasil_fields.dart';
import 'package:intl/intl.dart';

class Formatters {

  ///Formatar String para Data brasileira
  String formatStringToDateTime(String data){
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(data));
  }

  ///Formatar String em Data e Hora
  String formatStringForDateAndTime(String data){
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(data));
  }

  ///Retirar os caracteres do telefone
  String clearPhoneCharacters(String telefone){
    return telefone.replaceAll('(', '').replaceAll(')', '').replaceAll('-', '').replaceAll(' ', '');
  }

  ///Retirar os caracteres do CEP
  String clearCepCharacters(String cep){
    return cep.replaceAll('-', '').replaceAll('.', '');
  }

  ///Formatar Telefone
  String formatPhone(String phone){
    return UtilBrasilFields.obterTelefone(phone);
  }

}

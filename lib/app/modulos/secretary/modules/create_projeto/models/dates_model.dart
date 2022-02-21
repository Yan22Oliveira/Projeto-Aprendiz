import '../../../../../shared/shared.dart';

class DatesModel {

  String? initialDate;
  String? finalDate;

  DatesModel({
    this.initialDate,
    this.finalDate,
  });

  @override
  String toString() {
    return 'DatesModel{ initialDate: $initialDate, finalDate: $finalDate}';
  }

  String datesFormatadas(){
    if(validarCamposData()){
      var dateInicial = Formatters().formatStringToDateTime(initialDate!);
      var dateFinal   = Formatters().formatStringToDateTime(finalDate!);
      return '$dateInicial  -  $dateFinal';
    }else{
      return 'null';
    }
  }

  bool validarCamposData (){
    return (initialDate != null) && (finalDate != null);
  }

}
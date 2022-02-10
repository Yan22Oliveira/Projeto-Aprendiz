import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {

  final Connectivity connectivity;
  ConnectivityService(this.connectivity);

  ///Verificar a conexão do dispositivo
  Future<bool> checkConnectivity() async {
    try{
      var connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        return true;
      }else{
        return false;
      }
    }catch(e){
      return false;
    }
  }

}
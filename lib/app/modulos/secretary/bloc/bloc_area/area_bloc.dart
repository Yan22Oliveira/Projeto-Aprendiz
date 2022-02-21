import 'package:bloc/bloc.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class AreaBloc extends Bloc<AreaEvent,AreaState>{

  final AreaRepository areaRepository;
  final ConnectivityService _connectivityService;

  AreaBloc(
      this.areaRepository,
      this._connectivityService,
      ) : super(AreaInitial()){
    on<PesquisarArea>(listaArea);
  }

  Future listaArea(PesquisarArea event, Emitter<AreaState> emit) async {

    emit(AreaLoading());

    if(await _connectivityService.checkConnectivity()){
      try{
        List<AreaModel> lista = await areaRepository.getAreas();
        emit(AreaSucessful(lista));
      }catch(e){
        emit(AreaError('Erro ao carregar as Áreas!'));
      }
    }else{
      emit(AreaNoConnection('verifique a sua conexão com a internet'));
    }

  }

}
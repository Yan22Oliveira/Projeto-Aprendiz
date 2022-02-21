import 'package:bloc/bloc.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class RegionsBloc extends Bloc<RegionsEvent,RegionsState>{

  final RegionsRepository regionsRepository;
  final ConnectivityService _connectivityService;

  RegionsBloc(
      this.regionsRepository,
      this._connectivityService,
      ) : super(RegionsInitial()){
    on<PesquisarRegions>(listaRegions);
  }

  Future listaRegions(PesquisarRegions event, Emitter<RegionsState> emit) async {

    emit(RegionsLoading());

    if(await _connectivityService.checkConnectivity()){
      try{
        List<RegionsModel> lista = await regionsRepository.getRegions();
        emit(RegionsSucessful(lista));
      }catch(e){
        emit(RegionsError('Erro ao carregar as regiões!'));
      }
    }else{
      emit(RegionsNoConnection('verifique a sua conexão com a internet'));
    }

  }

}
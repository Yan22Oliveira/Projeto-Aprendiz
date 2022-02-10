import 'package:bloc/bloc.dart';

import '../pastor.dart';
import '../../../../../shared/shared.dart';

class PastorBloc extends Bloc<PastorEvent,PastorState>{

  final PastorRepository listaConteudosRepository;
  final ConnectivityService _connectivityService;

  PastorBloc(
      this.listaConteudosRepository,
      this._connectivityService,
      ) : super(PastorInitial()){
    on<PesquisarPastores>(listaPastors);
  }

  Future listaPastors(PesquisarPastores event, Emitter<PastorState> emit) async {

    emit(PastorLoading());

    if(await _connectivityService.checkConnectivity()){
      try{
        List<PastorModel> lista = await listaConteudosRepository.getPastors();
        emit(PastorSucessful(lista));
      }catch(e){
        emit(PastorError('Erro ao carregar os conteúdos!'));
      }
    }else{
      emit(PastorNoConnection('verifique a sua conexãocom a internet'));
    }

  }

}
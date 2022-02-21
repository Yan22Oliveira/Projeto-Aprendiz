import 'package:bloc/bloc.dart';

import '../pastor.dart';
import '../../../../../shared/shared.dart';

class PastorBloc extends Bloc<PastorEvent,PastorState>{

  final PastorRepository pastorsRepository;
  final ConnectivityService _connectivityService;

  PastorBloc(
      this.pastorsRepository,
      this._connectivityService,
      ) : super(PastorInitial()){
    on<PesquisarPastores>(listaPastors);
  }

  Future listaPastors(PesquisarPastores event, Emitter<PastorState> emit) async {

    emit(PastorLoading());

    if(await _connectivityService.checkConnectivity()){
      try{
        List<PastorModel> lista = await pastorsRepository.getPastors();
        emit(PastorSucessful(lista));
      }catch(e){
        emit(PastorError('Erro ao carregar!'));
      }
    }else{
      emit(PastorNoConnection('Verifique a sua conexão com a internet'));
    }

  }

}
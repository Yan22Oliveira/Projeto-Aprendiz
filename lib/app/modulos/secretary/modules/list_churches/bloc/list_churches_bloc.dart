import 'package:bloc/bloc.dart';

import '../list_churches.dart';
import '../../../../../shared/shared.dart';

class ListChurchesBloc extends Bloc<ListChurchesEvent,ListChurchesState>{

  final ListChurchesRepository listChurchesRepository;
  final ConnectivityService _connectivityService;

  ListChurchesBloc(
      this.listChurchesRepository,
      this._connectivityService,
      ) : super(ListChurchesInitial()){
    on<PesquisarListChurches>(listaListChurches);
  }

  Future listaListChurches(PesquisarListChurches event, Emitter<ListChurchesState> emit) async {

    emit(ListChurchesLoading());

    if(await _connectivityService.checkConnectivity()){
      try{
        List<ChurchModel> lista = await listChurchesRepository.getListChurches();
        emit(ListChurchesSucessful(lista));
      }catch(e){
        emit(ListChurchesError('Erro ao carregar as Igrejas!'));
      }
    }else{
      emit(ListChurchesNoConnection('verifique a sua conexão com a internet'));
    }

  }

}
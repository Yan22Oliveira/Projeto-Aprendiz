import 'package:bloc/bloc.dart';

import '../shepherd.dart';
import './event/shepherd_event.dart';
import './states/shepherd_states.dart';

class ShepherdBloc extends Bloc<ShepherdEvent,ShepherdState>{

  final ShepherdRepository listaConteudosRepository;

  ShepherdBloc(this.listaConteudosRepository) : super(ShepherdInitial()){
    on<PesquisarPastores>(listaShepherds);
  }

  Future listaShepherds(PesquisarPastores event, Emitter<ShepherdState> emit) async {

    emit(ShepherdLoading());

    try{
      List<ShepherdModel> lista = await listaConteudosRepository.getShepherds();
      emit(ShepherdSucessful(lista));
    }catch(e){
      emit(ShepherdError('Erro ao carregar os conteúdos!'));
    }

  }

}
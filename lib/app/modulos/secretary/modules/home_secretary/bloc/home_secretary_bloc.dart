import 'package:bloc/bloc.dart';

import '../../../secretary.dart';
import '../../../../../shared/shared.dart';

class HomeBloc extends Bloc<HomeSecretaryEvent,HomeSecretaryState>{

  final HomeRepository homeRepository;
  final ConnectivityService _connectivityService;

  HomeBloc(
      this.homeRepository,
      this._connectivityService,
      ) : super(HomeSecretaryInitial()){
    on<PesquisarInformacoes>(listaInformacoes);
  }

  int statusVazio = 0;
  int statusAtivo = 1;
  int statusErro  = 2;

  Future listaInformacoes(PesquisarInformacoes event, Emitter<HomeSecretaryState> emit) async {

    emit(HomeSecretaryLoading());

    if(await _connectivityService.checkConnectivity()){
      try{

        HomeModel home = await homeRepository.getInformacoes();

        if(verificarProjetoAtivo(home)){
          emit(HomeSecretarySucessful(home));
        }else if(verificarProjetoVazio(home)){
          emit(HomeSecretaryEmpty('Lista vazia'));
        }else{
          emit(HomeSecretaryError('Erro ao carregar!'));
        }

      }catch(e){
        emit(HomeSecretaryError('Erro ao carregar!'));
      }
    }else{
      emit(HomeSecretaryNoConnection('Verifique a sua conexão com a internet'));
    }

  }

  bool verificarProjetoAtivo(HomeModel homeModel){
    return (homeModel.status! == statusAtivo);
  }

  bool verificarProjetoVazio(HomeModel homeModel){
    return (homeModel.status! == statusVazio);
  }


}
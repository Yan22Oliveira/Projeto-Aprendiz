import 'package:bloc/bloc.dart';

import '../announcements.dart';
import '../../../../../shared/shared.dart';

class AnnouncementsBloc extends Bloc<AnnouncementsEvent,AnnouncementsState>{

  final AnnouncementsRepository listaConteudosRepository;
  final ConnectivityService _connectivityService;

  AnnouncementsBloc(
      this.listaConteudosRepository,
      this._connectivityService,
      ) : super(AnnouncementsInitial()){
    on<PesquisarComunicados>(listaAnnouncementss);
  }

  Future listaAnnouncementss(PesquisarComunicados event, Emitter<AnnouncementsState> emit) async {

    emit(AnnouncementsLoading());

    if(await _connectivityService.checkConnectivity()){
      try{
        List<AnnouncementsModel> lista = await listaConteudosRepository.getAnnouncements();
        emit(AnnouncementsSucessful(lista));
      }catch(e){
        emit(AnnouncementsError('Erro ao carregar os comunicados!'));
      }
    }else{
      emit(AnnouncementsNoConnection('verifique a sua conexãocom a internet'));
    }

  }

}
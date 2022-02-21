import 'package:bloc/bloc.dart';

import '../announcements.dart';
import '../../../../../shared/shared.dart';

class AnnouncementsBloc extends Bloc<AnnouncementsEvent,AnnouncementsState>{

  final AnnouncementsRepository announcementsRepository;
  final ConnectivityService _connectivityService;

  AnnouncementsBloc(
      this.announcementsRepository,
      this._connectivityService,
      ) : super(AnnouncementsInitial()){
    on<PesquisarComunicados>(listaAnnouncementss);
  }

  Future listaAnnouncementss(PesquisarComunicados event, Emitter<AnnouncementsState> emit) async {

    emit(AnnouncementsLoading());

    if(await _connectivityService.checkConnectivity()){
      try{
        List<AnnouncementsModel> lista = await announcementsRepository.getAnnouncements();
        emit(AnnouncementsSucessful(lista));
      }catch(e){
        emit(AnnouncementsError('Erro ao carregar os comunicados!'));
      }
    }else{
      emit(AnnouncementsNoConnection('verifique a sua conexãocom a internet'));
    }

  }

}
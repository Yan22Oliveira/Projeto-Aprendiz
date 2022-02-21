import 'package:bloc/bloc.dart';

import '../teachers.dart';
import '../../../../../shared/shared.dart';

class TeachersBloc extends Bloc<TeachersEvent,TeachersState>{

  final TeachersRepository teachersRepository;
  final ConnectivityService _connectivityService;

  TeachersBloc(
      this.teachersRepository,
      this._connectivityService,
      ) : super(TeachersInitial()){
    on<PesquisarTeachers>(listaTeachers);
  }

  Future listaTeachers(PesquisarTeachers event, Emitter<TeachersState> emit) async {

    emit(TeachersLoading());

    if(await _connectivityService.checkConnectivity()){
      try{
        List<TeacherModel> lista = await teachersRepository.getTeachers();
        emit(TeachersSucessful(lista));
      }catch(e){
        emit(TeachersError('Erro ao carregar!'));
      }
    }else{
      emit(TeachersNoConnection('Verifique a sua conexão com a internet!'));
    }

  }

}
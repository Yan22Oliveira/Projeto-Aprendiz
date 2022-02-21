import 'package:bloc/bloc.dart';

import '../students.dart';
import '../../../../../shared/shared.dart';

class StudentsBloc extends Bloc<StudentsEvent,StudentsState>{

  final StudentsRepository studentsRepository;
  final ConnectivityService _connectivityService;

  StudentsBloc(
      this.studentsRepository,
      this._connectivityService,
      ) : super(StudentsInitial()){
    on<PesquisarStudents>(listaStudents);
  }

  Future listaStudents(PesquisarStudents event, Emitter<StudentsState> emit) async {

    emit(StudentsLoading());

    if(await _connectivityService.checkConnectivity()){
      try{
        List<StudentModel> lista = await studentsRepository.getStudents();
        emit(StudentsSucessful(lista));
      }catch(e){
        emit(StudentsError('Erro ao carregar!'));
      }
    }else{
      emit(StudentsNoConnection('Verifique a sua conexão com a internet'));
    }

  }

}
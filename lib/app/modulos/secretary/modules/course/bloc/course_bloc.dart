import 'package:bloc/bloc.dart';

import '../course.dart';
import '../../../../../shared/shared.dart';

class CourseBloc extends Bloc<CourseEvent,CourseState>{

  final CourseRepository courseRepository;
  final ConnectivityService _connectivityService;

  CourseBloc(
      this.courseRepository,
      this._connectivityService,
      ) : super(CourseInitial()){
    on<PesquisarCourse>(listaCourses);
  }

  Future listaCourses(PesquisarCourse event, Emitter<CourseState> emit) async {

    emit(CourseLoading());

    if(await _connectivityService.checkConnectivity()){
      try{
        List<CourseModel> lista = await courseRepository.getCourses();
        emit(CourseSucessful(lista));
      }catch(e){
        emit(CourseError('Erro ao carregar'));
      }
    }else{
      emit(CourseNoConnection('verifique a sua conexãocom a internet'));
    }

  }

}
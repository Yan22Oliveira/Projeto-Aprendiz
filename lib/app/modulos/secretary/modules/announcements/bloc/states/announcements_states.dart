import '../../announcements.dart';

abstract class AnnouncementsState {

}

class AnnouncementsInitial implements AnnouncementsState{

}

class AnnouncementsLoading implements AnnouncementsState{

}

class AnnouncementsSucessful implements AnnouncementsState{
  final List<AnnouncementsModel> lista;
  AnnouncementsSucessful(this.lista);
}

class AnnouncementsNoConnection implements AnnouncementsState{
  final String message;
  AnnouncementsNoConnection(this.message);
}

class AnnouncementsError implements AnnouncementsState{
  final String message;
  AnnouncementsError(this.message);
}
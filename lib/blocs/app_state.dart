import 'package:equatable/equatable.dart';
import 'package:superhero_app/pages/models/hero.dart';

enum Status {
  loading,
  showPicker,
  connected,
  calling,
  incalling,
  incoming,
}

class AppState extends Equatable{
  AppState({this.status = Status.loading, this.heroes, this.me, this.him, this.isFrontCamera = true, this.mute=false});
  final Status status;
  final Map<String, Hero> heroes;
  final Hero me, him;
  final bool isFrontCamera, mute;


  @override
  List<Object> get props => [status, heroes, me, him, isFrontCamera, mute];

  factory AppState.initialState()=> AppState(heroes: Map<String, Hero>());

  AppState copyWith({Status status, Map<String, Hero> heroes, Hero me, Hero him, bool isFrontCamera, bool mute}){
    return AppState(
      status: status ?? this.status,
      heroes: heroes ?? this.heroes,
      me: me ?? this.me,
      him: him ?? this.him,
      isFrontCamera: isFrontCamera ?? this.isFrontCamera,
      mute: mute ?? this.mute,
    );
  }
}
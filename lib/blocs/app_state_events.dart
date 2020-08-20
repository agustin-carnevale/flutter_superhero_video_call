import 'package:equatable/equatable.dart';
import 'package:superhero_app/pages/models/hero.dart';

class AppStateEvent extends Equatable{
  AppStateEvent([ this._props = const [] ]);
  final List _props;

  @override
  List<Object> get props => _props;
}

class LoadingEvent extends AppStateEvent{}

class ShowPickerEvent extends AppStateEvent{
  ShowPickerEvent(this.heroes): super([heroes]);
  final Map<String,dynamic> heroes;
}

class PickHeroEvent extends AppStateEvent{
  PickHeroEvent(this.heroName): super([heroName]);
  final String heroName;
}

class ConnectedEvent extends AppStateEvent{
  ConnectedEvent(this.hero): super([hero]);
  final Hero hero;
}

class TakenEvent extends AppStateEvent{
  TakenEvent({this.heroName, this.isTaken}): super([heroName, isTaken]);
  final String heroName;
  final bool isTaken;
}

class CallingEvent extends AppStateEvent{
  CallingEvent(this.hero): super([hero]);
  final Hero hero;
}

class InCallingEvent extends AppStateEvent{}

class IncomingEvent extends AppStateEvent{
  IncomingEvent(this.heroName): super([heroName]);
  final String heroName;
}

class AcceptOrDeclineEvent extends AppStateEvent{
  AcceptOrDeclineEvent(this.accept): super([accept]);
  final bool accept;
}

class CancelRequestEvent extends AppStateEvent{}

class FinishCallEvent extends AppStateEvent{}

class SwitchCameraEvent extends AppStateEvent{
  SwitchCameraEvent(this.isFrontCamera): super([isFrontCamera]);
  final bool isFrontCamera;
}

class MuteMicrophoneEvent extends AppStateEvent{
  MuteMicrophoneEvent(this.mute): super([mute]);
  final bool mute;
}
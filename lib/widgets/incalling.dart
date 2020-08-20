import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superhero_app/blocs/app_state.dart';
import 'package:superhero_app/blocs/app_state_bloc.dart';
import 'package:superhero_app/blocs/app_state_events.dart';
import 'package:flutter_webrtc/webrtc.dart';

class InCalling extends StatelessWidget {
  const InCalling({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appStateBloc = BlocProvider.of<AppStateBloc>(context);

    return BlocBuilder<AppStateBloc, AppState>(
          builder: (BuildContext context, AppState state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child:Transform.scale(
                    scale: 2,
                    alignment: Alignment.center,
                    child: RTCVideoView(appStateBloc.remoteRenderer))),
                Positioned(
                  right: 20,
                  top: 20,
                  child: SafeArea(
                    child: Transform.scale(
                      scale: 0.3,
                      alignment: Alignment.topRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 480,
                          height: 640,
                          color: Color(0xffcccccc),
                          child: RTCVideoView(appStateBloc.localRenderer),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          heroTag: 'mic',
                          backgroundColor: Colors.blueAccent.withOpacity(state.mute ? 0.3 : 1),
                          child: Icon(
                            state.mute 
                            ? Icons.mic_off
                            : Icons.mic
                          ),
                          onPressed: (){
                            appStateBloc.add(MuteMicrophoneEvent(!state.mute));
                          }
                        ),
                        CupertinoButton(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(30),
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: Icon(Icons.call_end, size: 40,), 
                          onPressed: (){
                            appStateBloc.add(FinishCallEvent());
                          }),
                        FloatingActionButton(
                          heroTag: 'cam',
                          child: Icon(
                            state.isFrontCamera 
                            ? Icons.camera_rear
                            : Icons.camera_front
                            ),
                          onPressed: (){
                            appStateBloc.add(SwitchCameraEvent(!state.isFrontCamera));
                          }
                        ), 
                      ]
                    ),
                  )
                )
              ],
            );
        }
    );
  }
}
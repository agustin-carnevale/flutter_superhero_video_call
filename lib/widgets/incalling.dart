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
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Transform.scale(
                    scale: 0.3,
                    alignment: Alignment.bottomLeft,
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
              ],
            );
        }
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superhero_app/blocs/app_state.dart';
import 'package:superhero_app/blocs/app_state_bloc.dart';
import 'package:superhero_app/blocs/app_state_events.dart';

class Incoming extends StatelessWidget {
  const Incoming({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appStateBloc = BlocProvider.of<AppStateBloc>(context);

    return BlocBuilder<AppStateBloc, AppState>(
          builder: (BuildContext context, AppState state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    state.him.avatar,
                    width: 100,
                )),
                SizedBox(height: 20),
                Text("Llamada entrante.."),
                Text(state.him.name),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.call),
                      onPressed: (){
                        appStateBloc.add(AcceptOrDeclineEvent(true));
                      },
                    ),
                    SizedBox(width: 60),
                     FloatingActionButton(
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.call_end),
                      onPressed: (){
                        appStateBloc.add(AcceptOrDeclineEvent(false));
                      },
                    )
                  ]
                )
              ],
            );
        }
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superhero_app/blocs/app_state.dart';
import 'package:superhero_app/blocs/app_state_bloc.dart';
import 'package:superhero_app/widgets/calling.dart';
import 'package:superhero_app/widgets/connected.dart';
import 'package:superhero_app/widgets/incalling.dart';
import 'package:superhero_app/widgets/incoming.dart';
import 'package:superhero_app/widgets/show_picker.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: BlocBuilder<AppStateBloc, AppState>(
          builder: (BuildContext context, AppState state) {
        switch (state.status) {
          case Status.loading:
            return CupertinoActivityIndicator(radius: 15);
            break;
          case Status.showPicker:
            return ShowPicker();
            break;
          case Status.connected:
            return Connected();
            break;
          case Status.calling:
            return Calling();
            break;
          case Status.incoming:
            return Incoming();
            break;
          case Status.incalling:
            return InCalling();
            break;
          default:
            return Container();
        }
      }),
    ));
  }
}

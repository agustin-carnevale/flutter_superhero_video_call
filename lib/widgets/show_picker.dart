import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superhero_app/blocs/app_state.dart';
import 'package:superhero_app/blocs/app_state_bloc.dart';
import 'package:superhero_app/blocs/app_state_events.dart';

class ShowPicker extends StatelessWidget {
  const ShowPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appStateBloc = BlocProvider.of<AppStateBloc>(context);

    return BlocBuilder<AppStateBloc, AppState>(
          builder: (BuildContext context, AppState state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Selecciona tu heroe",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10),
                Wrap(
                  children: state.heroes.values.map((hero){
                  return AbsorbPointer(
                    absorbing: hero.isTaken,
                    child: Opacity(
                      opacity: hero.isTaken ? 0.3 : 1.0,
                      child: CupertinoButton(
                        onPressed: () {
                          appStateBloc.add(PickHeroEvent(hero.name));
                        },
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              hero.avatar,
                              width: 100,
                            )),
                      ),
                    ),
                  );
                }).toList())
              ],
          );
        }
    );
  }
}
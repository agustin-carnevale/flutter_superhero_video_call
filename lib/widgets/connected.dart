import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superhero_app/blocs/app_state.dart';
import 'package:superhero_app/blocs/app_state_bloc.dart';
import 'package:superhero_app/blocs/app_state_events.dart';

class Connected extends StatelessWidget {
  const Connected({Key key}) : super(key: key);

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
                    state.me.avatar,
                    width: 100,
                )),
                SizedBox(height:10),
                Text(state.me.name),

                SizedBox(height:30),

                Column(
                  children: state.heroes.values.where((item)=>item.name != state.me.name).map((hero){
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                      child: Opacity(
                        opacity: hero.isTaken? 1: 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    hero.avatar,
                                    width: 60,
                                )),
                                SizedBox(width: 15),
                                Text(hero.name),
                              ],
                            ),
                            FloatingActionButton(
                              child: Icon(Icons.call),
                              onPressed: (){
                                if(hero.isTaken){
                                  appStateBloc.add(CallingEvent(hero));
                                }
                              }
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),),
            ],);
        }
    );
  }
}
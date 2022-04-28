import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebel_movie/bloc/similar/similar_bloc.dart';
import 'package:rebel_movie/ui/pages/pages.dart';

import 'bloc/now_playing/nowplaying_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rebel-Movie',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => NowPlayingBloc()
            ..add(
              NowPlayingFetch(),
            ),
        ),
        BlocProvider(create: (context) => SimilarBloc()),
      ], child: const StartingPage()),
    );
  }
}

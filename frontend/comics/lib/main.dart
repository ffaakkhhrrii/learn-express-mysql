import 'package:comics/features/comics/presentation/bloc/comic/comic_bloc.dart';
import 'package:comics/features/comics/presentation/bloc/comic/comic_event.dart';
import 'package:comics/features/comics/presentation/pages/home/comics_list.dart';
import 'package:comics/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicBloc>(
      create: (context) => sl()..add(const GetComics()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ComicsList(),
      ),
    );
  }
}
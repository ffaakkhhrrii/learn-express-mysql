import 'package:comics/core/constants/constans.dart';
import 'package:comics/features/comics/domain/entities/comics.dart';
import 'package:comics/features/comics/presentation/bloc/comic/comic_bloc.dart';
import 'package:comics/features/comics/presentation/bloc/comic/comic_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComicsList extends StatelessWidget {
  const ComicsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody(){
    return BlocBuilder<ComicBloc,ComicState>(builder: (_,state){
      if(state is ComicLoading){
        return const Center(child: CircularProgressIndicator(),);
      }
      if(state is ComicError){
        return const Center(child: Icon(Icons.refresh),);
      }
      if(state is ComicDone){
        return ListView.builder(
          itemCount: state.comics!.length,
          itemBuilder: (context,index){
            ComicsEntity comics = state.comics![index];
            return ListTile(
              title: Image.network(
                "${baseUrl}/${comics.image}"
              ),
            );
        });
      }
      return const SizedBox();
    });
  }
}
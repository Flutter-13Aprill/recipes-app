import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/data/recipes_data.dart';
import 'package:recipes_app/screen/upload/bloc/upload_bloc.dart';
import 'package:recipes_app/widget/profile/card/recipes_card.dart';

class RecipesContainer extends StatelessWidget {
  const RecipesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadBloc(),

      child: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: BlocBuilder<UploadBloc, UploadState>(
                builder: (context, state) {
                  if (state is UploadInitial) {
                    return Wrap(
                      children:
                          RecipesData.recipesdata
                              .map(
                                (item) => RecipesCard(
                                  title: item["name"],
                                  img: item["img"],
                                ),
                              )
                              .toList(),
                    );
                  }
                  return Wrap(children: []);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/data/recipes_data.dart';
import 'package:recipes_app/screen/home/bloc/home_bloc.dart';
import 'package:recipes_app/widget/home/card/recipes_card.dart';

class LikesContainer extends StatelessWidget {
  const LikesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeInitial) {
                    return Wrap(
                      children:
                          RecipesData.allRecipesdata.map((item) {
                            if (item["isFavorite"] == "true") {
                              return RecipesCard(
                                id: item["id"],
                                profileImg: item["profileImg"],
                                name: item["name"],
                                img: item["img"],
                                title: item["title"],
                                isFavorite: item["isFavorite"],
                              );
                            }
                            return SizedBox();
                          }).toList(),
                    );
                  }
                  return Wrap(children: [
                     
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

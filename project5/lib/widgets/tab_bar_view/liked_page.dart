import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project5/extensions/sizes.dart';
import 'package:project5/screens/home/bloc/likes_bloc.dart';
import 'package:project5/widgets/post2.dart';

class LikedPage extends StatelessWidget {
  const LikedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth() * 0.85,
      height: context.getHeight() * 0.4,
      child: BlocBuilder<LikesBloc, LikesState>(
        builder: (context, state) {
          final bloc = context.read<LikesBloc>();
          return GridView.builder(
            itemCount: bloc.liked.isEmpty ? 1 : bloc.liked.length,
            itemBuilder: (context, index) {
              return Posts2(
                models: bloc.recpiesModel[index],
                onPressed: () {
                  print(index);

                  bloc.add(RemoveEvent(deleteId: bloc.recpiesModel[index].id));
                  bloc.recpiesModel[index].isLike =
                      !bloc.recpiesModel[index].isLike;
                },
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (1 / 2),
            ),
          );
        },
      ),
    );
  }
}

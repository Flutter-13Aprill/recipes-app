import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project5/extensions/sizes.dart';
import 'package:project5/screens/home/bloc/likes_bloc.dart';
import 'package:project5/screens/recipe/bloc/recpie_bloc.dart';
import 'package:project5/widgets/post_for_model.dart';

class RecpiesPage extends StatelessWidget {
  const RecpiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: context.getWidth() * 0.85,
                height: context.getHeight() * 0.45,
                child: BlocBuilder<RecpieBloc, RecpieState>(
                  builder: (context, state) {
                    final bloc = context.read<RecpieBloc>();
                    return GridView.count(crossAxisCount: 2,
                    childAspectRatio: 1/2,
                    children: [
                      ... bloc.list
                    ],
                  
                    
                    );
                  },
                ),
              );
  }
}
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/Theme/app_colors.dart';
import 'package:recipes_app/views/layout/bloc/layout_bloc.dart';

class LayoutView extends StatelessWidget {
  LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutBloc(),
      child: BlocBuilder<LayoutBloc, LayoutState>(
        builder: (context, state) {
          final bloc = context.read<LayoutBloc>();
          return Scaffold(
            appBar: bloc.appBars[bloc.visit],
            bottomNavigationBar: BottomBarCreative(
              items: bloc.items,
              backgroundColor: AppColors.background,
              color: AppColors.border,
              colorSelected: bloc.colorSelect,
              indexSelected: bloc.visit,
              isFloating: true,
              onTap: (int index) {
                bloc.add(ChangePage(index: index));
              },
            ),
            body: SafeArea(
              child: SingleChildScrollView(child: bloc.views[bloc.visit]),
            ),
          );
        },
      ),
    );
  }
}

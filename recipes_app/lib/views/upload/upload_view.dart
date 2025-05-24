import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/Theme/app_colors.dart';
import 'package:recipes_app/style/my_style.dart';
import 'package:recipes_app/views/layout/bloc/layout_bloc.dart';
import 'package:recipes_app/widgets/auth/text_filed_auth_widget.dart';
import 'package:recipes_app/widgets/mainButton_widget.dart';
import 'package:recipes_app/widgets/upload/upload_widget.dart';

class UploadView extends StatelessWidget {
  const UploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        final bloc = context.read<LayoutBloc>();

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UploadWidget(),
              StyleApp.sizeH24,
              Text(
                "Food Name",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              StyleApp.sizeH16,

              TextFiledAuthWidget(
                validator: null,
                hintText: "Enter food name",
                prefixIcon: null,
                onChange: (p0) {
                  bloc.foodName = p0;
                },
              ),
              StyleApp.sizeH24,

              Text(
                "Description",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              StyleApp.sizeH16,

              TextFiledAuthWidget(
                onChange: (p0) {
                  bloc.foodDescription = p0;
                },
                validator: null,
                hintText: "Tell a little about your food",
                prefixIcon: null,
                maxLines: 2,
              ),
              StyleApp.sizeH24,
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Cooking Duration '),
                    TextSpan(
                      text: '(in minutes)',
                      style: TextStyle(color: AppColors.textHint),
                    ),
                  ],
                ),
              ),
              StyleApp.sizeH16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "<10",
                    style: TextStyle(
                      color: AppColors.success,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "30",
                    style: TextStyle(
                      color: AppColors.success,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ">60",
                    style: TextStyle(
                      color: AppColors.success,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              StyleApp.sizeH8,
              Slider(
                value: bloc.sliderValue,
                min: 0,
                activeColor: AppColors.success,
                max: 60,
                divisions: 60,
                label: bloc.sliderValue.round().toString(),
                onChanged: ( value) {
                  bloc.sliderValue = value;
                  bloc.add(ChangeSlider(value: value));
                },
              ),
              StyleApp.sizeH24,
              Align(
                alignment: Alignment.center,
                child: MainButtonWidget(
                  onTap: () {
                    bloc.showUploadDialog(context);
                    bloc.add(CreateRecipe());
                  },
                  text: "add",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

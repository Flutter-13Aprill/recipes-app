import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipes_app/screens/bottomnavbar/bloc/upload_bloc.dart';
import 'package:recipes_app/style/app_buttons.dart';
import 'package:recipes_app/style/app_colors.dart';
import 'package:recipes_app/style/app_spacing.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:recipes_app/utils/extensions/screen/screen_size.dart';
import 'package:recipes_app/widgets/custom_alert_dialog_widget.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});
  // UploadScreen widget allows users to pick an image, enter food details (name, description), select cooking duration via a slider, and submit the data using a form managed by Bloc for state management, with validation and user feedback.

  @override
  Widget build(BuildContext context) {
    XFile? pickedFile;
    final bloc = context.read<UploadBloc>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 18),
                      children: [
                        TextSpan(
                          text: '1 /',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' 2',
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppSpacing.h32,
              InkWell(
                onTap: () async {
                  pickedFile = await bloc.picker.pickImage(
                    source: ImageSource.gallery,
                  );
                },
                child: DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    radius: Radius.circular(20),
                    dashPattern: [10, 5],
                    strokeWidth: 2,
                    color: AppColors.lightSecondary,
                  ),
                  child: SizedBox(
                    height: context.getHeight(factor: 0.2),
                    width: context.getWidth(factor: 0.9),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/upload.png"),
                        AppSpacing.h16,

                        Text(
                          'Add Cover Photo',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        AppSpacing.h8,

                        Text(
                          '(up to 12 Mb)',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 8,
                ),
                child: Form(
                  key: bloc.formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Food Name",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      AppSpacing.h8,
                      TextFormField(
                        controller: bloc.nameController,
                        decoration: InputDecoration(
                          label: Text(
                            "Enter food name",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),

                            borderSide: BorderSide(
                              color: AppColors.lightSecondary,
                            ),
                          ),

                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),

                            borderSide: BorderSide(color: Colors.red),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),

                            borderSide: BorderSide(
                              color: AppColors.lightSecondary,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),

                            borderSide: BorderSide(color: Colors.red),
                          ),

                          contentPadding: EdgeInsets.all(13),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Food name is required';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Description",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      AppSpacing.h8,

                      TextFormField(
                        controller: bloc.descController,

                        minLines: 3,
                        maxLines: 15,
                        decoration: InputDecoration(
                          label: Text(
                            "Tell a little about your food",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          alignLabelWithHint: true,

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),

                            borderSide: BorderSide(
                              color: AppColors.lightSecondary,
                            ),
                          ),

                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),

                            borderSide: BorderSide(color: Colors.red),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),

                            borderSide: BorderSide(
                              color: AppColors.lightSecondary,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),

                            borderSide: BorderSide(color: Colors.red),
                          ),
                          contentPadding: EdgeInsets.all(13),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Description is required';
                          }
                          return null;
                        },
                      ),
                      AppSpacing.h16,
                      Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 18),
                            children: [
                              TextSpan(
                                text: 'Cooking Duration',

                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              TextSpan(
                                text: ' (in minutes)',
                                style: TextStyle(color: AppColors.secondary),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppSpacing.h16,

                      BlocBuilder<UploadBloc, UploadState>(
                        builder: (context, state) {
                          final double minutes =
                              (state is SuccessState) ? state.minutes : 40;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "<10",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          (minutes.round() >= 10)
                                              ? AppColors.buttonColor
                                              : AppColors.secondary,
                                    ),
                                  ),
                                  Text(
                                    "30",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          (minutes.round() >= 30)
                                              ? AppColors.buttonColor
                                              : AppColors.secondary,
                                    ),
                                  ),
                                  Text(
                                    ">60",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          (minutes.round() >= 60)
                                              ? AppColors.buttonColor
                                              : AppColors.secondary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 8,
                                  thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 12,
                                  ),
                                  overlayShape: const RoundSliderOverlayShape(
                                    overlayRadius: 20,
                                  ),
                                  activeTrackColor: AppColors.buttonColor,
                                  inactiveTrackColor: AppColors.lightSecondary,
                                  thumbColor: AppColors.buttonColor,
                                  overlayColor: AppColors.buttonColor,
                                ),
                                child: Slider(
                                  value: minutes.clamp(10, 60),
                                  min: 10,
                                  max: 60,

                                  label: '${minutes.round()} Minutes',
                                  onChanged: (value) {
                                    bloc.add(SliderChangedEvent(value));
                                  },
                                ),
                              ),
                              Text('Duration: ${minutes.round()} minutes'),
                            ],
                          );
                        },
                      ),

                      AppSpacing.h16,

                      AppSpacing.h32,

                      ElevatedButton(
                        style: AppButtons.primary(context),

                        onPressed: () {
                          if (bloc.formKey.currentState!.validate()) {
                            if (pickedFile != null) {
                              bloc.add(
                                SavedRecipeEvent(
                                  name: bloc.nameController.text,
                                  desc: bloc.descController.text,
                                  imagePath: pickedFile!,
                                ),
                              );

                              bloc.nameController.clear();
                              bloc.descController.clear();

                              showDialog(
                                context: context,
                                builder: (_) => CustomAlertDialogWidget(),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('No image selected'),
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:blocrecipes/CustomWidgets/UploadScreen/cover_photo_section.dart';
import 'package:blocrecipes/Helper/screen_extension.dart';
import 'package:blocrecipes/Screens/upload/bloc/upload_bloc.dart';
import 'package:blocrecipes/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadBloc(),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocBuilder<UploadBloc, UploadState>(
            builder: (context, state) {
              var bloc = context.read<UploadBloc>();

              return BlocListener<UploadBloc, UploadState>(
                listener: (listenerContext, state) {
                  if (state is UploadSuccess) {
                    showDialog(
                      context: listenerContext,
                      builder: (listenerContext) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: context.screenHeight * 0.2,
                          ),
                          child: Center(
                            child: AlertDialog(
                              title: Text('Success'),
                              content: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      "assets/images/success.png",
                                      height: 160,
                                      width: 160,
                                    ),
                                    Text('Upload Success'),
                                    Text(
                                      'Your recipe has been uploaded.\nYou can see it in your profile.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: secondaryText,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  style:
                                      Theme.of(
                                        listenerContext,
                                      ).elevatedButtonTheme.style,
                                  onPressed: () {
                                    Navigator.of(listenerContext).pop();
                                    // Go back to previous screen
                                  },
                                  child: Text(
                                    'Back to Home',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
                child: Scaffold(
                  body: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: bloc.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Cancel',
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '1/',
                                  style: TextStyle(
                                    color: mainText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' 2',
                                      style: TextStyle(
                                        color: secondaryText,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          BlocProvider.value(
                            value: bloc,
                            child: CoverPhotoSection(),
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Food Name',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: mainText,
                            ),
                          ),
                          TextFormField(
                            controller: bloc.nameController,
                            decoration: InputDecoration(
                              hintText: "Enter food name",
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 20,
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: secondaryText),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: primaryColor),
                              ),
                            ),
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'Please enter food name'
                                        : null,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: mainText,
                            ),
                          ),
                          TextFormField(
                            controller: bloc.descController,
                            decoration: InputDecoration(
                              hintText: 'Tell a little about your food',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: secondaryText),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: primaryColor),
                              ),
                            ),
                            maxLines: 3,
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'Please enter description'
                                        : null,
                          ),
                          SizedBox(height: 16),
                          RichText(
                            text: TextSpan(
                              text: 'Cooking Duration',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: mainText,
                              ),
                              children: [
                                TextSpan(
                                  text: ' (in minutes)',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: secondaryText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "<10",
                                style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      (bloc.sliderValue > 0.167)
                                          ? primaryColor
                                          : secondaryText,
                                ),
                              ),
                              Text(
                                "30",
                                style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      (bloc.sliderValue > 0.5)
                                          ? primaryColor
                                          : secondaryText,
                                ),
                              ),
                              Text(
                                ">60",
                                style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      (bloc.sliderValue > 0.9)
                                          ? primaryColor
                                          : secondaryText,
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            activeColor: primaryColor,
                            value: bloc.sliderValue,
                            onChanged: (value) {
                              bloc.add(SliderClicked(value));
                            },
                          ),
                          SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: () {
                              bloc.add(SubmitRecipe());
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

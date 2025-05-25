import 'package:blocrecipes/Helper/screen_extension.dart';
import 'package:blocrecipes/Screens/upload/bloc/upload_bloc.dart';
import 'package:blocrecipes/Styles/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoverPhotoSection extends StatelessWidget {
  const CoverPhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBloc, UploadState>(
      builder: (context, state) {
        var bloc = context.read<UploadBloc>();
        return GestureDetector(
          onTap: () => bloc.add(PickImageEvent()),
          child: Align(
            alignment: Alignment.center,
            child: DottedBorder(
              options: RoundedRectDottedBorderOptions(
                dashPattern: [10, 5],
                strokeWidth: 2,
                radius: Radius.circular(16),
                color: secondaryText,
              ),
              child: Container(
                height: context.screenHeight * 0.22,
                width: context.screenHeight * 0.40,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image:
                      bloc.file != null
                          ? DecorationImage(
                            image: bloc.file!,
                            fit: BoxFit.cover,
                          )
                          : null,
                ),
                child:
                    bloc.file == null
                        ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: context.screenHeight * 0.04),
                            Image.asset(
                              "assets/images/imagepicker.png",
                              height: 64,
                              width: 64,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              "Add cover Photo",
                              style: TextStyle(
                                color: mainText,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Up to 12MB",
                              style: TextStyle(
                                color: secondaryText,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                        : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

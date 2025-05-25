import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/extensions/screens/get_size_screen.dart';
import 'package:recipes_app/features/upload/bloc/uplaod_bloc.dart';

import 'package:recipes_app/style/style_color.dart';

class CoverPhotoWidget extends StatelessWidget {
  /// CoverPhotoWidget: Displays a tappable dotted border area for selecting/uploading a cover photo.
  const CoverPhotoWidget({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UplaodBloc, UplaodState>(
      builder: (context, state) {
        final bloc = context.read<UplaodBloc>();
        final hasImage = bloc.imagePick.isNotEmpty;
        return InkWell(
          mouseCursor: SystemMouseCursors.click,
          onTap: () {
            bloc.add(PickImageEvent());
          },
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            width: context.getWidth(),
            height: context.getHeight() / 5,
            child: DottedBorder(
              options: RectDottedBorderOptions(
                borderPadding: EdgeInsets.all(16),
                color: StyleColor.secondaryText,
                dashPattern: [6, 4],
                strokeWidth: 2,
                padding: EdgeInsets.all(16),
              ),
              child: Center(
                child:
                    hasImage
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            bloc.imagePick.last,
                            fit: BoxFit.cover,
                          ),
                        )
                        : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              size: 50,
                              color: StyleColor.secondaryText,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Add Cover Photo",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              "(up to 12 Mb)",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
              ),
            ),
          ),
        );
      },
    );
  }
}

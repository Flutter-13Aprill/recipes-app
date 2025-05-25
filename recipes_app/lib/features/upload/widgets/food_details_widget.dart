import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/upload/bloc/uplaod_bloc.dart';
import 'package:recipes_app/features/widgets/text_field_widget.dart';
import 'package:recipes_app/style/style_color.dart';

class FoodDetailsWidget extends StatelessWidget {
  /// FoodDetailsWidget: Form section to input food details including name, description, and cooking duration.
  const FoodDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UplaodBloc, UplaodState>(
      builder: (context, state) {
        final bloc = context.read<UplaodBloc>();
        return Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: bloc.formKey,
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food Name
                  Text(
                    "Food Name",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  TextFieldWidget(
                    controller: bloc.foodNameController,
                    textHint: "Enter food name",
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),

                  // Description
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  TextFormField(
                    maxLines: 3,

                    controller: bloc.descriptionController,
                    decoration: InputDecoration(
                      hintText: "Tell a little about your food",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            // Cooking Duration
            Text(
              "Cooking Duration (in minutes)",
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("<10", style: TextStyle(color: Colors.grey)),
                Text("30", style: TextStyle(color: Colors.grey)),
                Text(">60", style: TextStyle(color: Colors.grey)),
              ],
            ),
            Slider(
              value: bloc.cookingDuration,
              onChanged: (val) {
                final snappedValue = bloc.snapDuration(val);
                bloc.add(UpdateCookingDurationEvent(snappedValue));
              },
              min: 0,
              max: 60,
              divisions: 2,
              activeColor: StyleColor.primary,
              inactiveColor: Colors.grey.shade300,
            ),
          ],
        );
      },
    );
  }
}

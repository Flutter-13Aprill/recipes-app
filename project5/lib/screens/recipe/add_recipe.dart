import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project5/extensions/sizes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:project5/extensions/theme_text.dart';
import 'package:project5/screens/recipe/bloc/recpie_bloc.dart';
import 'package:project5/theme/app_colors.dart';
import 'package:project5/widgets/posts.dart';

class AddRecipe extends StatelessWidget {
  const AddRecipe({super.key,});


  @override
  Widget build(BuildContext context) {
      TextEditingController foodName = TextEditingController();

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Container(
            width: context.getWidth() * 0.85,
            height: context.getHeight() * 0.7,
            child: Column(
              spacing: 8,
              children: [
                DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    strokeWidth: 2,
                    color: Color.fromARGB(255, 208, 219, 234),
                    dashPattern: [10, 3],
                    radius: Radius.circular(25),
                  ),
                  child: Container(
                    width: 327,
                    height: 161,
    
                    child: Column(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/image.png'),
                        Text(
                          'Add Cover Photo',
                          style: context.titleL()!.copyWith(fontSize: 15),
                        ),
                        Text(
                          '(up to 12 Mb)',
                          style: context.bodyS()!.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: context.getWidth() * 0.75,
                  height: context.getHeight() * 0.03,
                  child: Text(
                    'Food Name',
                    style: context.titleL()!.copyWith(fontSize: 17),
                  ),
                ),
                Container(
                  width: context.getWidth() * 0.76,
                  child: TextFormField(controller: foodName,
                    decoration: InputDecoration(
                      hintText: 'Enter food name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: context.getWidth() * 0.75,
                  height: context.getHeight() * 0.03,
                  child: Text(
                    'Description',
                    style: context.titleL()!.copyWith(fontSize: 17),
                  ),
                ),
                Container(
                  width: context.getWidth() * 0.76,
                  child: TextFormField(
                    maxLines: 5,
    
                    decoration: InputDecoration(
                      hintText: 'Tell a little about your food',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: context.getWidth() * 0.75,
                  height: context.getHeight() * 0.03,
                  child: Row(
                    children: [
                      Text(
                        'Cook Duration ',
                        style: context.titleL()!.copyWith(fontSize: 17),
                      ),
                      Text(
                        '(in minutes)',
                        style: context.bodyS()!.copyWith(fontSize: 17),
                      ),
                    ],
                  ),
                ),
    
                BlocBuilder<RecpieBloc, RecpieState>(
                  builder: (context, state) {
                    final bloc = context.read<RecpieBloc>();
                    return Container(
                      width: context.getWidth() * 0.75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '<10',
                            style: context.bodyM()!.copyWith(
                              fontWeight: FontWeight.bold,
                              color:
                                  bloc.sliderIndex >= 0
                                      ? AppColors.buttonsColor
                                      : AppColors.unselected,
                            ),
                          ),
                          Text(
                            '30',
                            style: context.bodyM()!.copyWith(
                              fontWeight: FontWeight.bold,
                              color:
                                  bloc.sliderIndex >= 0.5
                                      ? AppColors.buttonsColor
                                      : AppColors.unselected,
                            ),
                          ),
                          Text(
                            '>60',
                            style: context.bodyM()!.copyWith(
                              fontWeight: FontWeight.bold,
                              color:
                                  bloc.sliderIndex >= 1
                                      ? AppColors.buttonsColor
                                      : AppColors.unselected,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                BlocBuilder<RecpieBloc, RecpieState>(
                  builder: (context, state) {
                    final bloc = context.read<RecpieBloc>();
                    return Slider(
                      activeColor: AppColors.buttonsColor,
                      value: bloc.sliderIndex,
                      divisions: 2,
                      onChanged: (value) {
                        bloc.add(SliderEvnt(index: value));
                      },
                    );
                  },
                ),
                
                Container(
                  width: context.getWidth() * 0.76,
                  height: context.getHeight() * 0.058,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: AppColors.buttonsColor,
                  ),
                  child: BlocBuilder<RecpieBloc, RecpieState>(
                    builder: (context, state) {
                      final bloc = context.read<RecpieBloc>();
                      return TextButton(
                        onPressed: () {
                          bloc.add(
                            AddEvent(
                              recpie: Posts(
                                setProfile: 'assets/images/profile5.png',
                                setName: 'Choirul Syafril',
                                setFoodImage: 'assets/images/pancake.png',
                                onPressed: () {},
                                setFoodName: foodName.text,
                                isLiked: false,
                              )
                            ),
                          );
    
                          showDialog(
                            context: context,
                            builder: (context) {
                              return UnconstrainedBox(
                                child: Container(
                                  width: 327,
                                  height: 458,
                                  color: Colors.white,
                                  child: Dialog(
                                    backgroundColor: Colors.white,
                                    child: Column(
                                      spacing: 8,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/icons/party.png'),
                                        Text(
                                          textAlign: TextAlign.center,
                                          'Upload Success',
                                          style: context.titleL()!.copyWith(
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text(
                                          textAlign: TextAlign.center,
                                          'Your recpie has been uploaded,you can see it on your profile',
                                          style: context.titleL()!.copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          width: context.getWidth() * 0.76,
                                          height: context.getHeight() * 0.058,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(32),
                                            color: AppColors.buttonsColor,
                                          ),
    
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Back',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

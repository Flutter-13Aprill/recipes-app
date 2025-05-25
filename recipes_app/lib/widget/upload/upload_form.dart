import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/screen/bottom_navigation_screen.dart';
import 'package:recipes_app/screen/upload/bloc/upload_bloc.dart';
import 'package:recipes_app/theme/app_colors.dart';
import 'package:recipes_app/widget/upload/upload_img.dart';

class UploadForm extends StatelessWidget {
  const UploadForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return BlocProvider(
      create: (context) => UploadBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<UploadBloc>();

          return Form(
            key: formKey,
            child: Column(
              children: [
                BlocBuilder<UploadBloc, UploadState>(
                  builder: (context, state) {
                    if (state is SuccessUploadImg) {
                      return SizedBox(
                        height: 161,
                        child: Image.file(state.image),
                      );
                    }
                    return InkWell(
                      onTap: () {
                        bloc.add(UploadImgfromGallery());
                      },
                      child: UploadImg(),
                    );
                  },
                ),
                SizedBox(height: 24),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Food Name",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Enter food name",
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xff9FA5C0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD0DBEA)),
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: TextFormField(
                    controller: descriptionController,
                    minLines: 3,
                    maxLines: 6,
                    keyboardType: TextInputType.multiline,

                    decoration: InputDecoration(
                      hintText: "Tell a little about your food",
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xff9FA5C0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD0DBEA)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      bloc.add(
                        AddedRecipe(
                          name: nameController.text,
                          description: descriptionController.text,
                        ),
                      );
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: SingleChildScrollView(
                              child: SizedBox(
                                height: 400,
                                child: Column(
                                  children: [
                                    Image.asset("images/emoji.png"),
                                    SizedBox(height: 32),
                                    Text(
                                      "Upload Success",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22,
                                        color: AppColors.mainText,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Your recipe has been uploaded,\nyou can see it on your profile",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: AppColors.mainText,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 40),

                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (BuildContext context) =>
                                                    BottomNavigationScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 56,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            32,
                                          ),
                                          color: AppColors.primary,
                                        ),
                                        child: Text(
                                          "Back to Home",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.white,
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
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: AppColors.primary,
                    ),
                    child: Text(
                      "Next",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

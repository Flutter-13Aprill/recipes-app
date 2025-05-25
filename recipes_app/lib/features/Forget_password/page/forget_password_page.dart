
import 'package:recipes_app/core/text/app_text.dart';
import 'package:recipes_app/features/Forget_password/wedget/custom_alert_wedgit.dart';
import 'package:recipes_app/core/widget/custom_text_field.dart';
import 'package:recipes_app/core/extensions/screen/screen_size.dart';

import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});
   final forgetkey =GlobalKey<FormState>();
final TextEditingController email = TextEditingController();
 final emailRegExp = RegExp(
  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(AppText.projectTitle,style: Theme.of(context).textTheme.titleLarge,),),
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: context.getWidth(per: 0.90)),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: context.getHeight(per: 2),),
              Form( key: forgetkey,
                child: CustomTextField(hint: 'Email',lefticon: Icons.mail_outlined,text:AppText.enterEmail ,controllers:email ,condition: (value) {
                  if(value == null || value.isEmpty){
                    return "email is requierd";
                  }else if (!emailRegExp.hasMatch(value)) {
                    return 'Email not correct ';
                  }
                  return null;
                },
                
                
                ),
              ), SizedBox(height: context.getHeight(per: 1),)
              ,ElevatedButton(onPressed: (){if (forgetkey.currentState!.validate()) {showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(title:  AppText.emailSend, bodyText:  AppText.emailMessage, buttonText:  AppText.moveToLogin);
          },
              );}   }, child: Text(AppText.verfy)),
               SizedBox(height: context.getHeight(per: 3),)
            ],
          ),
        ),
      )),
    );
  }
}
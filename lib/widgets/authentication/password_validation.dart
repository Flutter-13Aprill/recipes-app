import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re/app_theming/app_colors.dart';
import 'package:re/screens/authentication/bloc/auth_bloc.dart';


class PasswordValidation extends StatelessWidget {
  const PasswordValidation({super.key, required this.authBloc});

  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authBloc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          
          Text('Your Password must contain:',style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.mainTextColor,fontWeight: FontWeight.w300,fontSize: 15,),),

          Row(
            spacing: 8,
            children: [
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is PasswordMetRequirementsState) {
                    return Icon(
                      Icons.check_circle,
                      size: 15,
                      color: AppColors.buttonColor,
                    );
                  } else if (state is PasswordDoesNotMeetRequirementsState) {
                    return Icon(
                      Icons.check_circle,
                      size: 15,
                      color: Colors.red,
                    );
                  }
                  return Icon(
                    Icons.check_circle,
                    size: 15,
                    color: Color(0xff9FA5C0),
                  );
                },
              ),

              Text(
                'At least 6 characters',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.mainTextColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          Row(
            spacing: 8,
            children: [
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  
                  if (state is PasswordMetRequirementsState) {
                    return Icon(Icons.check_circle,size: 15,color: AppColors.buttonColor,);
                  } else if (state is PasswordDoesNotMeetRequirementsState) {
                    return Icon(Icons.check_circle,size: 15,color: Colors.red,);
                  }
                  return Icon(Icons.check_circle,size: 15,color: Color(0xff9FA5C0),);

                },
              ),

              Text('Contains a number',style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.mainTextColor,fontWeight: FontWeight.w300,fontSize: 12,),),
            ],
          ),
        ],
      ),
    );
  }
}

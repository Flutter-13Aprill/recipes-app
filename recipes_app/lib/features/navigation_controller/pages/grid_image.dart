import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/theme/app_palette.dart';
import 'package:recipes_app/features/navigation_controller/pages/bloc/like_bloc.dart';

class GridImage extends StatelessWidget {
  const GridImage({
    super.key,
    required this.user,
    required this.title,
    required this.time,
    required this.imagePath,
    required this.avatar,
  });
  final String user;
  final String title;
  final String time;
  final String imagePath;
  final String avatar;
  
  @override
  Widget build(BuildContext context) {
     Color isLiked;
    return BlocProvider(
      create: (context) => LikeBloc(),
      child: BlocBuilder<LikeBloc, LikeState>(
        builder: (context, state) {
          if(state is LikedState){
            isLiked=AppPalette.red;

          }else{
            isLiked=AppPalette.whiteColor;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 14, backgroundImage: AssetImage(avatar)),
                  SizedBox(width: 6),
                  Text(user, style: TextStyle(fontSize: 12)),
                ],
              ),
              SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.asset(
                      imagePath,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border, color: isLiked),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                "Food · $time",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          );
        },
      ),
    );
  }
}

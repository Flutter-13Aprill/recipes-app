import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project5/extensions/sizes.dart';
import 'package:project5/extensions/theme_text.dart';
import 'package:project5/models/recpies_model.dart';
import 'package:project5/screens/home/bloc/likes_bloc.dart';
import 'package:project5/theme/app_colors.dart';
import 'package:project5/widgets/post2.dart';
import 'package:project5/widgets/posts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: context.getWidth(),
            child: Container(
              width: context.getWidth() * 0.85,
              child: Column(
                children: [
                  SizedBox(
                    width: context.getWidth() * 0.85,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Image.asset('assets/icons/search.png'),
                        hintText: 'Search',
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: context.getWidth() * 0.80,
                    child: Text(
                      textAlign: TextAlign.left,
                      'Catagory',
                      style: context.bodyM()!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 62, 84, 129),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  DefaultTabController(
                    length: 3,
                    child: Container(
                      width: context.getWidth() * 0.85,
                      child: TabBar(
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        labelColor: Colors.white,
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: AppColors.buttonsColor,
                        ),

                        tabs: [
                          SizedBox(width: 68, child: Tab(text: 'All')),
                          SizedBox(width: 86, child: Tab(text: 'Food')),
                          SizedBox(width: 86, child: Tab(text: 'Drink')),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  DefaultTabController(
                    length: 2,
                    child: UnconstrainedBox(
                      child: Container(
                        width: context.getWidth(),
                        child: TabBar(
                          labelColor: Color.fromARGB(255, 62, 84, 129),
                          unselectedLabelColor: Color.fromARGB(
                            255,
                            159,
                            165,
                            192,
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: AppColors.buttonsColor,
                          tabs: [
                            Container(
                              height: 37,
                              child: Text(
                                'Left',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 37,
                              child: Text(
                                'Right',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: context.getWidth() * 0.85,
                    height: context.getHeight() * 0.55,
                    child: BlocBuilder<LikesBloc, LikesState>(
                      builder: (context, state) {
                        final bloc = context.read<LikesBloc>();
                        return GridView.builder(
                          itemCount: bloc.recpiesModel.length,
                          itemBuilder: (context, index) {
                            return Posts2(
                              models: bloc.recpiesModel[index],
                              onPressed: () {
                                if (bloc.recpiesModel[index].isLike == false) {
                                  bloc.add(
                                    FavoriteEvent(
                                      liked: bloc.recpiesModel[index],
                                    ),
                                  );
                                  bloc.recpiesModel[index].isLike =
                                      !bloc.recpiesModel[index].isLike;
                                } else {
                                  bloc.add(
                                    RemoveEvent(
                                      // liked: bloc.recpiesModel[index],
                                      deleteId: bloc.liked[index].id,
                                    ),
                                  );
                                  bloc.recpiesModel[index].isLike =
                                      !bloc.recpiesModel[index].isLike;
                                }
                              },
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: (1 / 2),
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
      ),
    );
  }
}

List<Widget> posts = [
  Posts(
    setProfile: 'assets/images/profile1.png',
    setName: 'Calum Lewis',
    setFoodName: 'Pancake',
    isLiked: false,
    setFoodImage: 'assets/images/pancake.png',
    onPressed: () {
      print('clicked');
    },
  ),

  Posts(
    setProfile: 'assets/images/profile2.png',
    setName: 'Eilif Sonas',
    setFoodName: 'Salad',
    isLiked: false,

    setFoodImage: 'assets/images/salad.png',
    onPressed: () {},
  ),

  Posts(
    setProfile: 'assets/images/profile3.png',
    setName: 'Elena Shelby',
    setFoodName: 'Crepe',
    isLiked: false,

    setFoodImage: 'assets/images/crepe.png',
    onPressed: () {},
  ),
  Posts(
    setProfile: 'assets/images/profile4.png',
    setName: 'John Priyadi',
    setFoodName: 'Fruits',
    isLiked: false,
    setFoodImage: 'assets/images/fruits.png',
    onPressed: () {},
  ),
];

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course_app/constants.dart';
import 'package:online_course_app/model/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 15, right: 20),
        child: Column(children: [
          Text(
            "Hey Bhim Raj",
            style: kHeadingextStyle,
            textAlign: TextAlign.left,
          ),
          Text(
            "Find a course you want to learn",
            style: kSubheadingextStyle,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/search.svg"),
                SizedBox(width: 16),
                Text(
                  "Search for anything",
                  style: TextStyle(fontSize: 18, color: Color(0xFFA0A5BD)),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Category", style: kTitleTextStyle),
              Text(
                "See All",
                style: kSubtitleTextStyle.copyWith(color: kBlueColor),
              ),
            ],
          ),
          SizedBox(height: 30),
          Expanded(
            child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    height: index.isEven ? 200 : 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: kBlueColor,
                      image: DecorationImage(
                          image: AssetImage(categories[index].image),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categories[index].name,
                          style: kTitleTextStyle,
                        ),
                        Text("${categories[index].numOfCourses} Courses",
                            style:
                                TextStyle(color: kTextColor.withOpacity(0.5)))
                      ],
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
          )
        ]),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Container(
        alignment: Alignment.center,
        child: Text(
          "Online Course App",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        ),
      ),
      leading: IconButton(
          padding: EdgeInsets.only(left: 10),
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {}),
      actions: <Widget>[
        IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10),
            icon: Image.asset("assets/images/user.png"),
            onPressed: () {})
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItems extends StatelessWidget {




  final String Id;
  final String title;
  final Color color;
  CategoryItems(this.title, this.color,this.Id);

  void selectCategory(BuildContext ctx){
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
    //   return CategoryMealsScreen(Id,title);
    // },),);
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,arguments: {'title':title,'id': Id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),

      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.7),
            color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

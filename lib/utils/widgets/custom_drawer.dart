import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  List drawerItemList = [
    {
      'icon': Icons.bookmark_outline,
      'title': 'Templates',
    },
    {
      'icon': Icons.widgets_outlined,
      'title': 'Category',
    },
    {
      'icon': Icons.data_usage,
      'title': 'Analysis',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://cdn.vectorstock.com/i/preview-1x/55/86/anonymous-icon-incognito-sign-privacy-vector-34705586.webp'),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              child: Text(
                'Shihab Saleem',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: List.generate(
                drawerItemList.length,
                (index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Icon(
                      drawerItemList[index]['icon'],
                    ),
                    title: Text(
                      drawerItemList[index]['title'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Flexible(
              child: Container(
                height: 250,
                color: Color(0xff3450a1),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

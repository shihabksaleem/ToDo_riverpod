import 'package:flutter/material.dart';
import 'package:todo_riverpod/utils/widgets/custom_textform_filed.dart';
import 'package:todo_riverpod/view/home_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextformfield(
                  hint: 'First Name',
                ),
                SizedBox(height: 15),
                CustomTextformfield(
                  hint: 'Second Name',
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .7,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Get Started',
                      )),
                )
              ],
            )),
      ),
    );
  }
}

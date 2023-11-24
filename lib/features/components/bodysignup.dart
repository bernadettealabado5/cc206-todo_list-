import 'dart:html';

import 'package:cc206_todo_list_/features/components/already_have_an_account.dart';
import 'package:cc206_todo_list_/features/components/backgroundsignup.dart';
import 'package:cc206_todo_list_/features/components/rounded_button.dart';
import 'package:cc206_todo_list_/features/components/rounded_input_field.dart';
import 'package:cc206_todo_list_/features/components/rounded_password_field.dart';
import 'package:cc206_todo_list_/features/constants.dart';
import 'package:cc206_todo_list_/features/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "SIGN UP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.35),
          SvgPicture.asset(
            "icons/signup.svg",
            height: size.height * 0.35,
          ),
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "SIGN UP",
            press: () {},
          ),
          SizedBox(height: size.height * 0.35),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
          VerticalDivider(),
        ],
      ),
    );
  }
}

// class VerticalDivider extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       width: size.width * 0.8,
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: VerticalDivider(
//               color: Color(0xFFD9D9D9),
//               height: 1.5,
//               ),
//             ),
//           ),
//           Text(
//             "OR",
//             style: TextStyle(
//               color: kPrimaryColor,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

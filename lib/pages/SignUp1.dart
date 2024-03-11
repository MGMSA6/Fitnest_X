import 'package:fitnest_x/pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/colors.dart';
import 'Signup.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({Key? key}) : super(key: key);

  @override
  _SignUp1State createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: FittedBox(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      "assets/images/login.svg",
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // Adjust the spacing between image and text
                Text(
                  "Let’s complete your profile",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColor.blackColor),
                ),
                Text(
                  "It will help us to know more about you!",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grayColor1),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.borderColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: DropdownButtonFormField<String>(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      iconEnabledColor: AppColor.grayColor2,
                      iconSize: 23,
                      borderRadius: BorderRadius.zero,
                      decoration: InputDecoration(
                          label: Text("Choose Gender"),
                          labelStyle: TextStyle(color: AppColor.grayColor2),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              "assets/images/user.svg",
                              width: 18,
                              height: 18,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0),
                          )),
                      items: ["Male", "Female", "Other"]
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        // Handle dropdown value change
                        print(value);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColor.borderColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: "Date of Birth",
                        labelStyle: TextStyle(color: AppColor.grayColor2),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            "assets/images/calendar.svg",
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0),
                        )),
                    onTap: () {
                      _selectDate();
                    },
                    controller: _dateController,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8, // 80% space for TextField
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.borderColor,
                              borderRadius: BorderRadius.circular(14)),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3)
                            ],
                            decoration: InputDecoration(
                                labelText: "Your Weight",
                                labelStyle:
                                    TextStyle(color: AppColor.grayColor2),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    "assets/images/weight_scale.svg",
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 0),
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Space between TextField and Container
                      Expanded(
                        flex: 2, // 20% space for Container
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: AppColor.unitGradient,
                          ),
                          child: const Center(
                            child: Text(
                              'KG',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8, // 80% space for TextField
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.borderColor,
                              borderRadius: BorderRadius.circular(14)),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3)
                            ],
                            decoration: InputDecoration(
                                labelText: "Your Height",
                                labelStyle:
                                    const TextStyle(color: AppColor.grayColor2),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    "assets/images/swap.svg",
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 0),
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Space between TextField and Container
                      Expanded(
                        flex: 2, // 20% space for Container
                        child: Container(
                          height: 48,
                          width: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: AppColor.unitGradient,
                          ),
                          child: const Center(
                            child: Text(
                              'CM',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        gradient: AppColor.buttonColors,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 8,
                            offset: const Offset(
                                0, 4), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(99),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: const SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  // Adjust the color as needed
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime(2100));

    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}

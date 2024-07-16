import 'package:flutter/material.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';

import 'base_text.dart';

String? dropdownsex;

String? dropdowncountry;
String? dropdowncity;
bool checkboxvalue1 = false, checkboxvalue2 = false;

Widget filterdrawer(var context) {
  return new Drawer(child: StatefulBuilder(builder: (context, setState) {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: sizeAware.height * 0.035714285714286,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  child: Image.asset(
                    'assets/images/results.png',
                    color: primaryColor,
                    width: 30,
                    height: sizeAware.height * 0.035714285714286,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 4,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:
                        baseText('فرز نتائج', color: primaryColor, size: 12.0)),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: primaryColor,
                                width: 1,
                              ),
                            ),
                            width: 18,
                            height: 18,
                            child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Colors.transparent,
                              ),
                              child: Checkbox(
                                activeColor: Colors.transparent,
                                checkColor: primaryColor,
                                value: checkboxvalue1,
                                tristate: false,
                                onChanged: (bool? isChecked) {
                                  setState(() {
                                    checkboxvalue1 = isChecked!;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          baseText(
                            "الفئة الرئيسية",
                            color: primaryColor,
                            size: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: primaryColor,
                                width: 1,
                              ),
                            ),
                            width: 18,
                            height: 18,
                            child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Colors.transparent,
                              ),
                              child: Checkbox(
                                  activeColor: Colors.transparent,
                                  checkColor: primaryColor,
                                  value: checkboxvalue2,
                                  tristate: false,
                                  onChanged: (bool? isChecked) {
                                    setState(() {
                                      checkboxvalue1 = isChecked!;
                                    });
                                  }),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          baseText(
                            "الفئة الثانوية",
                            color: primaryColor,
                            size: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      )
                    ],
                  )

                  // Expanded(child:

                  //  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            baseText(
                              " الدولة",
                              color: primaryColor,
                              size: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: sizeAware.width * 0.22,
                              height: 25,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: othercolor,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(00)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: dropdowncountry,
                                  hint: Text("لبنان ", style: TextStyle()),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: primaryColor,
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: primaryColor),
                                  underline: Container(
                                    height: 0,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdowncountry = newValue;
                                    });
                                  },
                                  items: <String>['لبنان', 'سوريا', 'فلسطين']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: TextStyle()),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            baseText(
                              " المدينة",
                              color: primaryColor,
                              size: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: sizeAware.width * 0.22,
                              height: 25,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: othercolor,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(00)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: dropdowncity,
                                  hint: Text("بيروت"),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: primaryColor,
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: primaryColor),
                                  underline: Container(
                                    height: 0,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdowncity = newValue;
                                    });
                                  },
                                  items: <String>['بيروت', 'صيدا', 'صور']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ]),
              //////
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            baseText(
                              " الجنس",
                              color: primaryColor,
                              size: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: sizeAware.width * 0.22,
                              height: 25,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: othercolor,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(00)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: dropdownsex,
                                  hint: Text("ذكر ", style: TextStyle()),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: primaryColor,
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: primaryColor),
                                  underline: Container(
                                    height: 0,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownsex = newValue;
                                    });
                                  },
                                  items: <String>['ذكر', 'أنثى']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: TextStyle()),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ]),
              //////
            ),
          ],
        )
      ],
    );
  }));
}

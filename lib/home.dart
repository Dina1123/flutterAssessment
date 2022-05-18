import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task2/constant/counter.dart';
import 'package:task2/constant/header.dart';

import 'constant/constants.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is stay at home.",
              offset: offset,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        value: "Indonesia",
                        items: [
                          'Indonesia',
                          'Bangladesh',
                          'United States',
                          'Japan'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {}),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Case Update\n",
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text: "Newest update March 28",
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: kInfectedColor,
                          number: 1046,
                          title: "Infected",
                        ),
                        Counter(
                          color: kDeathColor,
                          number: 87,
                          title: "Deaths",
                        ),
                        Counter(
                          color: kRecovercolor,
                          number: 46,
                          title: "Recovered",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Spread of Virus",
                        style: kTitleTextstyle,
                      ),
                      Text(
                        "See details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool loading = false;
//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? Loading()
//         : Scaffold(
//             appBar: AppBar(
//               actions: [Icon(Icons.settings)],
//               title: Text("Let's Play"),
//               centerTitle: true,
//             ),
//             drawer: Drawer(
//               //backgroundColor: Theme.of(context).primaryColor,
//               child: Column(
//                 children: const <Widget>[
//                   UserAccountsDrawerHeader(
//                     accountName: Text(
//                       "Dina Ehab",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Colors.white,
//                       ),
//                     ),
//                     accountEmail: Text("dinaaehab@gmail.com"),
//                     currentAccountPicture: CircleAvatar(
//                       backgroundImage: NetworkImage(
//                           'https://p.kindpng.com/picc/s/668-6687298_cartoon-avatar-png-download-image-gaming-avatar-logo.png'),
//                     ),
//                     otherAccountsPictures: <Widget>[
//                       CircleAvatar(
//                         backgroundImage: NetworkImage(
//                             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-At9G_RcipqMfmV6UFRHGR6AhnTFkm-pgQ&usqp=CAU'),
//                       ),
//                     ],
//                   ),
//                   ListTile(
//                     title: Text("Sent"),
//                     leading: Icon(Icons.send),
//                   ),
//                   Divider(
//                     thickness: 1,
//                   ),
//                   ListTile(
//                     title: Text("Inbox"),
//                     leading: Icon(Icons.inbox),
//                   ),
//                   ListTile(
//                     title: Text("Stared"),
//                     leading: Icon(Icons.star),
//                   ),
//                   Divider(
//                     thickness: 1,
//                   ),
//                   ListTile(
//                     title: Text("Archive"),
//                     leading: Icon(Icons.archive),
//                   ),
//                   ListTile(
//                     title: Text("Chat"),
//                     leading: Icon(Icons.chat),
//                   ),
//                   Divider(
//                     thickness: 1,
//                   ),
//                   ListTile(
//                     title: Text("Log out"),
//                     leading: Icon(Icons.logout),
//                     //onTap: Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));
//                   ),
//                 ],
//               ),
//             ),
//             body: ListView(
//               scrollDirection: Axis.vertical,
//               children: const [
//                 Card(
//                   child: ListTile(
//                     title: Text('Cards'),
//                     leading: Image(
//                       image: NetworkImage(
//                         'https://i.pinimg.com/originals/15/53/76/155376d9d05a383b9c96957019968a60.jpg',
//                       ),
//                       width: 50,
//                     ),
//                   ),
//                 ),
//                 Card(
//                   child: ListTile(
//                     title: Text('UNO'),
//                     leading: Image(
//                       image: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgrd4qdyG2HCjWchVcW4WdUOCbD4MLOF87GQ&usqp=CAU'),
//                       width: 50,
//                       height: 50,
//                     ),
//                   ),
//                 ),
//                 Card(
//                   child: ListTile(
//                     title: Text('FootBall'),
//                     leading: Image(
//                       image: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIeK2Ahq1O4bQPt6TcPt-AN0nVmn-qRQXEXw&usqp=CAU'),
//                       width: 50,
//                       height: 50,
//                     ),
//                   ),
//                 ),
//                 Card(
//                   child: ListTile(
//                     title: Text('Zumba'),
//                     leading: Image(
//                       image: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6wCMs7r_YRnSJIxnCWbAeMX_6cmxQzie0Htisb_vR9iB3iECCZQ4LQU2mZm8p7h6ZWSs&usqp=CAU'),
//                       width: 50,
//                       height: 50,
//                     ),
//                   ),
//                 ),
//                 Card(
//                   child: ListTile(
//                     title: Text('BasketBall'),
//                     leading: Image(
//                       image: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdSwzED4eKLcjZ6UOrAj8o8uWNzu13VaZVYQ&usqp=CAU'),
//                       width: 50,
//                       height: 50,
//                     ),
//                   ),
//                 ),
//                 Card(
//                   child: ListTile(
//                     title: Text('Subway Surface'),
//                     leading: Image(
//                       image: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYanQYBuzUiAhlc41Hw2RLNM4aeVME8GGAXP_t3xvihrP-mDKijAErgy0NXBeSwu0Ohvs&usqp=CAU'),
//                       width: 50,
//                       height: 50,
//                     ),
//                   ),
//                 ),
//                 Card(
//                   child: ListTile(
//                     title: Text('Car Racing'),
//                     leading: Image(
//                       image: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaEe9lX_77P4gpYIa7Kq7RC82fhOBxq_byTQ&usqp=CAU'),
//                       width: 50,
//                       height: 50,
//                     ),
//                   ),
//                 ),
//                 Card(
//                   child: ListTile(
//                     title: Text('Chess'),
//                     leading: Image(
//                       image: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz1ye5tQEuKoCShEWxblPHwNdomwn_8ojLsw&usqp=CAU'),
//                       width: 50,
//                       height: 50,
//                     ),
//                   ),
//                 ),
//                 Card(
//                   child: ListTile(
//                     title: Text('Minesweeper'),
//                     leading: Image(
//                       image: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9v3T86d-9BAc775S1l9Z018QyV38Q_RElYQ&usqp=CAU'),
//                       width: 50,
//                       height: 50,
//                     ),
//                   ),
//                 ),
//                 Card(
//                   child: ListTile(
//                     title: Text('Sudoku'),
//                     leading: Image(
//                       image: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhqSgex8elM1y7EdW7KWWxgfB-2mkFGdeWtg&usqp=CAU'),
//                       width: 50,
//                       height: 50,
//                     ),
//                   ),
//                 ),
//                 Card(
//                   child: ListTile(
//                     title: Text('Master Chef'),
//                     leading: Image(
//                       image: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsbmoRVGN-bo-kPm7_4AM75dwzHAsiObQnfg&usqp=CAU'),
//                       width: 50,
//                       height: 50,
//                     ),
//                   ),
//                 ),
//                 // Card(
//                 //   child: ListTile(
//                 //     title: Text('Cards'),
//                 //     leading: Image(
//                 //       image: AssetImage('assets/images/'),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Card(
//                 //   child: ListTile(
//                 //     title: Text('Cards'),
//                 //     leading: Image(
//                 //       image: AssetImage('assets/images/'),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Card(
//                 //   child: ListTile(
//                 //     title: Text('Cards'),
//                 //     leading: Image(
//                 //       image: AssetImage('assets/images/'),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Card(
//                 //   child: ListTile(
//                 //     title: Text('Cards'),
//                 //     leading: Image(
//                 //       image: AssetImage('assets/images/'),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Card(
//                 //   child: ListTile(
//                 //     title: Text('Cards'),
//                 //     leading: Image(
//                 //       image: AssetImage('assets/images/'),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Card(
//                 //   child: ListTile(
//                 //     title: Text('Cards'),
//                 //     leading: Image(
//                 //       image: AssetImage('assets/images/'),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Card(
//                 //   child: ListTile(
//                 //     title: Text('Cards'),
//                 //     leading: Image(
//                 //       image: AssetImage('assets/images/'),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Card(
//                 //   child: ListTile(
//                 //     title: Text('Cards'),
//                 //     leading: Image(
//                 //       image: AssetImage('assets/images/'),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Card(
//                 //   child: ListTile(
//                 //     title: Text('Cards'),
//                 //     leading: Image(
//                 //       image: AssetImage('assets/images/'),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Card(
//                 //   child: ListTile(
//                 //     title: Text('Cards'),
//                 //     leading: Image(
//                 //       image: AssetImage('assets/images/'),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Card(
//                 //   child: ListTile(
//                 //     title: Text('Cards'),
//                 //     leading: Image(
//                 //       image: AssetImage('assets/images/'),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Card(
//                 //   child: ListTile(
//                 //     title: Text('Cards'),
//                 //     leading: Image(
//                 //       image: AssetImage('assets/images/'),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Card(
//                 //   child: ListTile(
//                 //     title: Text('Cards'),
//                 //     leading: Image(
//                 //       image: AssetImage('assets/images/'),
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//               shrinkWrap: true,
//               padding: EdgeInsets.all(10),
//             ),
//           );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/logout.dart';
//import 'home_screen.dart';
import 'gridinfo.dart';

class SideNavBar extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final name = 'Name';
    final email = 'demo@gmail.com';
    final urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        color: Colors.deepOrangeAccent.shade100,
        child: ListView(
          children: <Widget>[
            buildHeader(
                urlImage: urlImage,
                name: name,
                email: email,
                onClicked:
                    () {} //=> Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => UserPage(
                //     name: 'Sarah Abs',
                //     urlImage: urlImage,
                //   ),
                // )),
                ),
            Container(
              padding: padding,
              /*decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.black,
                width: 5.0,
              ))),*/
              child: Column(
                children: [
                  //const SizedBox(height: 2),
                  buildSearchField(),
                  const SizedBox(height: 3),
                  buildMenuItem(
                    text: 'Organ System',
                    icon: ImageIcon(
                      AssetImage('assets/organsystem.jpg'),
                      color: Colors.black,
                    ),
                    onClicked: () => selectedItem(context, 0),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  const SizedBox(height: 1),
                  buildMenuItem(
                    text: 'Surgical Prophylaxis',
                    icon: ImageIcon(
                      AssetImage('assets/surprop.png'),
                      color: Colors.black,
                    ),
                    onClicked: () => selectedItem(context, 1),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  const SizedBox(height: 1),
                  buildMenuItem(
                    text: 'Post Solid Organ Transplant',
                    icon: ImageIcon(
                      AssetImage('assets/transplant.png'),
                      color: Colors.black,
                    ),
                    onClicked: () => selectedItem(context, 2),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  const SizedBox(height: 1),
                  buildMenuItem(
                    text: 'Multi-Drug Resistant Bacteria',
                    icon: ImageIcon(
                      AssetImage('assets/drugres.png'),
                      color: Colors.black,
                    ),
                    onClicked: () => selectedItem(context, 3),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  //const SizedBox(height: 16),
                  //Divider(color: Color.fromARGB(255, 0, 0, 0)),
                  const SizedBox(height: 1),
                  buildMenuItem(
                    text: 'Additional Information',
                    icon: ImageIcon(
                      AssetImage('assets/info.png'),
                      color: Colors.black,
                    ),
                    onClicked: () => selectedItem(context, 4),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  //const SizedBox(height: 24),
                  //Divider(color: Color.fromARGB(255, 0, 0, 0)),
                  const SizedBox(height: 0.2),
                  buildMenuItem(
                    text: 'Account',
                    icon: ImageIcon(
                      AssetImage('assets/account.png'),
                      color: Colors.black,
                    ),
                    onClicked: () => selectedItem(context, 4),
                  ),
                  // const SizedBox(height: 16),
                  // buildMenuItem(
                  //   text: 'Notifications',
                  //   icon: Icons.notifications_outlined,
                  //   onClicked: () => selectedItem(context, 5),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 9, 9, 9)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 7, 7, 7)),
                  ),
                ],
              ),
              //Spacer(),
              // CircleAvatar(
              //   radius: 24,
              //   backgroundColor: Color.fromRGBO(118, 133, 184, 1),
              //   child: Icon(Icons.add_comment_outlined, color: Colors.white),
              // )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      //autofocus: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required ImageIcon icon,
    VoidCallback? onClicked,
  }) {
    final color = Color.fromARGB(255, 14, 14, 14);
    final hoverColor = Colors.white70;

    return ListTile(
      leading: icon,
      title: Text(text,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 20)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => info(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => info(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => info(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => info(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => logout(),
        ));
        break;
    }
  }
}

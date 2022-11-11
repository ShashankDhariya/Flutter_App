import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imgurl = "https://i0.wp.com/ayrshirecreditunion.co.uk/wp-content/uploads/2020/01/undraw_Mobile_app_p3ts.png?fit=1210%2C914&ssl=1";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader( 
                accountName: Text("Shashank"),
                accountEmail: Text("dhariyashahank@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imgurl),
                ),
              )
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
                ),
                title: Text(
                  "Email",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
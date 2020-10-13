import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  final bool products;
  const NavigationBar({Key key, @required this.products});
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex;
  final List<String> _list = ["my_orders", "initium", "user_account"];
  final List<String> _list2 = ["initium", "user_account"];

  @override
  Widget build(BuildContext context) {
    if (widget.products == false) {
      return BottomNavigationBar(
        backgroundColor: Colors.blueGrey[900],
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.description,
              color: Colors.white,
            ),
            title: Text(
              "Mis pedidos",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.all_inclusive,
              color: Colors.white,
            ),
            title: Text("Initium",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text("Mi cuenta",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400)),
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            Navigator.pushNamed(context, _list[_currentIndex]);
          });
        },
      );
    } else if (widget.products == true) {
      return BottomNavigationBar(
        backgroundColor: Colors.blueGrey[900],
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            title: Text(
              "Comercios",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text("Mi cuenta",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400)),
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            Navigator.pushNamed(context, _list2[_currentIndex]);
          });
        },
      );
      ;
    }
  }
}

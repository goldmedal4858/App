import 'package:flutter/material.dart';
import 'package:something/login/signup_page.dart';
import 'package:something/navigation_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {

    var screeninfo = MediaQuery.of(context);
    final double screenh = screeninfo.size.height;
    final double screenw = screeninfo.size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: screenh/30),
              Image.asset("images/gm3.jpg"),
              SizedBox(height: screenh/60),
              Text("GOLDMEDAL", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              SizedBox(height: screenh/40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color:Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: "Eposta Adresi",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenh/80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color:Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Şifre",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenh/50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: GestureDetector(
                      onTap: () {
                        print("şifreemi unuttum aq");
                      },
                      child: Text(
                          "Şifremi Unuttum", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenh/50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () {

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => NavigationContainer()));

                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text("Giriş Yap",
                          style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold, fontSize: 18 )),

                    ),
                  ),
                ),
              ),
              SizedBox(height: screenh/50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Bir hesabın yok mu?"),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SignupPage()));
                      print("hemen kaydol");
                    },
                      child: Text(
                          " Hemen Kaydol", style: TextStyle(fontWeight: FontWeight.bold))),

                ],
              ),
              SizedBox(height: screenh/7.5),
              Text("Ya da şunlarla bağlan:"),
              SizedBox(height: screenh/100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  SizedBox(
                      height: 60,
                      child: Image.asset("images/facebookicon2.png")),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                        height: 60,
                        child: Image.asset("images/twittericon2.png")),
                  ),
                  SizedBox(
                      height: 60,
                      child: Image.asset("images/googleplusicon2.png")),

                ],
              )
            ],
          ),
        ),
      )
    );
  }
}



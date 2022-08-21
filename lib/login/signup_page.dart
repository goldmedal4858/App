
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                        hintText: "İsim Soyisim",
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
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
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
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        border: InputBorder.none,
                        hintText: "Telefon numarası",
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
              SizedBox(height: screenh/80),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  child: DropdownSearch<String>.multiSelection(

                    items: ["Seçilebilir obje 1",
                      "Seçilebilir obje 2",
                      "Seçilebilir obje 3",
                      "Seçilebilir obje 4",
                      "Seçilebilir obje 5",
                      "Seçilebilir obje 6",
                      "Seçilebilir obje 7",
                    ],
                    popupProps: PopupPropsMultiSelection.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    onChanged: print,
                    selectedItems: ["seçilebilir obje 4"],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () {
                    //KAYIT OLMA İŞLEMİ BURADA OLACAK
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text("Kayıt Ol",
                          style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold, fontSize: 18 )),

                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}

import 'package:catatan_apps/screen/login_screen.dart';
import 'package:catatan_apps/services/firebase_auth_services.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuthServices fbServices = FirebaseAuthServices();
   bool showPassword = true;

  register() async {
    fbServices
        .registerAkun(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${value?.user?.email} success register'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        color: Color.fromRGBO(32, 32, 34, 50),     //fromRGBO(180, 189, 191, 2)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(color: Colors.white,    //fromRGBO(125, 135, 135, 50)
              shape: BoxShape.circle
              ),
              child: Center(
                child: Icon(Icons.manage_accounts, size: 85, color: Colors.black87),
                ),
            ),

            SizedBox(
              height: 30,
            ),

            Text('Register Account', style: TextStyle(fontSize: 20, color: Colors.black87),),

            SizedBox(
              height: 20,
            ),


            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                  
                  prefixIcon: Icon(Icons.contact_mail, size: 30, color: Colors.black87,),
                  hintText: "Masukkan Email",
                  hintStyle: TextStyle(color: Colors.black87,),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black87,),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white,)       //fromRGBO(135, 135, 135, 50)
                  ),
                  
                  
              ),
            ),


            SizedBox(
              height: 20,
            ),

            
            TextFormField(
              
              controller: passwordController,
              obscureText: showPassword,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                
                  prefixIcon: Icon(Icons.key, size: 30, color: Colors.black87,),
                  hintText: "Masukkan Password",
                  hintStyle: TextStyle(color: Colors.black87,),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black87,),
                  suffixIcon: InkWell(
                    child: Icon(showPassword ? Icons.visibility : Icons.visibility_off,size: 25 , color: Colors.black87,),
                    onTap: () {
                      if (showPassword) 
                      {setState(() {
                        showPassword = false;
                      });
                        
                      }else{
                        setState(() {
                          showPassword = true;
                        });
                      }
                    },
                  ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white,)            //fromRGBO(135, 135, 135, 50)
                  ),
                  
              ),
            ),


            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                register();
              },
              child: Text("REGISTER", style: TextStyle(fontSize: 10, color: Colors.white), 
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Sudah Punya Akun? Login disini', style: TextStyle(fontSize: 10, color: Colors.blueAccent,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

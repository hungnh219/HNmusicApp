import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music_app/models/provider.dart';
import 'package:music_app/models/user.dart';

import 'package:music_app/screens/home/home_page.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key:key);
  
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;  
    final size_margin_input=size.height*0.3;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    BuildContext mContextUser=context;

    return Scaffold(
      resizeToAvoidBottomInset: false,

      body:  Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration( 
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 222, 230, 237),Color.fromARGB(255, 97, 104, 118)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
                  ),
                  width: double.infinity,
                  height: size.height*0.4,
                  child: const Center(child: Image(image: AssetImage('assets/images/logo.png'),),
                  ),
                ),
                SafeArea(child: Container(  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0, 5))
                    ]
                  ),
                  margin:  EdgeInsets.only(top:size_margin_input,right: 10,left: 10),
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10,right: 5,left: 5),
                    child: Column(
                      
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10,),
                        const Text("Login",
                        style: TextStyle(fontSize: 30,
                        fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: emailController,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255,104, 210, 232)),
                              
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255,104, 210, 232),
                                width: 2, 
                              )
                            ),
                            prefixIcon: Icon(Icons.mail,color: Color.fromARGB(255,104, 210, 232),),
                            hintText: 'Youremail@gmail.com'
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255,104, 210, 232)),
                              
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255,104, 210, 232),
                                width: 2, 
                              )
                            ),
                            prefixIcon: Icon(Icons.lock,color: Color.fromARGB(255,104, 210, 232),),
                            hintText: 'Your password'
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.only(top:20,bottom:10),
                          child: Consumer<FooterProvider>(
                            builder: (context, myFooter, child) {
                              return ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: const Color.fromARGB(255, 245, 245, 245)),
                                    onPressed: () {
                                      String email=emailController.text;
                                      String password=passwordController.text;
                                      
                                      bool isSuccess=userlist.any((user)=>user.email==email&&user.password==password);
                                      if(isSuccess) {
                                       
                                        
                                        Fluttertoast.showToast( 
                                                msg: "Thành công",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: const Color.fromARGB(255, 198, 174, 172),
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                           context.read<UserPovider>().setUser(email);

                                            myFooter.ChangeScreen(0);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => HomeScreen())  
                                            ); 
                                       
                                      } else {
                                        Fluttertoast.showToast( 
                                                msg: "Sai mật khẩu",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: const Color.fromARGB(255, 198, 174, 172),
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                      }
                                      
                                    },
                                    child: const Text('Log in', style: TextStyle(fontSize: 28)
                                  ),);
                            }
                          ),
                        ),
                        
                      ],
                    ),
                  )
                )
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                  
                            children: [
                              Text("Don't have an account?"),
                              TextButton(
                                style: TextButton.styleFrom(
                                  //backgroundColor: Colors.white, // background
                                ),
                                child: Text('Create now', style: TextStyle(fontSize: 17)),
                                onPressed: () => {},
                              ),
                            ],
                          ),
                )
              ]),
              
            ),
        );
  }
}

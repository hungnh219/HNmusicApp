import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;  
    final size_margin_input=size.height*0.3;
    return Scaffold(
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
                          child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: const Color.fromARGB(255, 245, 245, 245)),
                                onPressed: () => {
                                  Fluttertoast.showToast(
                                            msg: "Bạn đã đăng nhập",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: const Color.fromARGB(255, 198, 174, 172),
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        ),
                                  Navigator.pushNamed(context, '/a')
                                },
                                child: const Text('Loggin', style: TextStyle(fontSize: 28)
                              ),),
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
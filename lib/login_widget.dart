import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget{
  const LoginWidget({ Key? key, required this.login}) : super (key: key);
  final void Function(String email, String pass) login;

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

  class _LoginWidgetState extends State<LoginWidget> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordCOntroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Login Screen", style: Theme.of(context).textTheme.headline3,),
          SizedBox(height: 50,),
          Container(
            //margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
              child: Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                  children: [
                    TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                            hintText: "Email",
                            fillColor: Color(0xFF4C555C),
                            filled: true,
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18.0), borderSide: (BorderSide(color: Colors.cyan.shade900, width: 1.0))),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18.0), borderSide: (BorderSide(color: Colors.indigo.shade900, width: 1.0))),
                          ),
                          validator: (value){
                            return null;
                          
                          },
                          controller: _emailController,
                        ),
                        SizedBox(height: 20.0,),
                    TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            fillColor: Color(0xFF4C555C),
                            filled: true,
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18.0), borderSide: (BorderSide(color: Colors.cyan.shade900, width: 1.0))),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18.0), borderSide: (BorderSide(color: Colors.indigo.shade900, width: 1.0))),
                          ),
                          validator: (value){
                            return null;
                          
                          },
                          controller: _passwordCOntroller,
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Expanded(
                              child: 
                               ElevatedButton(
                                onPressed: (){
                                  widget.login(_emailController.text,
                                  _passwordCOntroller.text);
                                }, 
                                child: Text('Login'), 
                                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15.0),
                                textStyle: TextStyle(fontSize: 20.0),
                                primary: Color(0xFF32383D))),
                              ),
                          ],
                        )
                        
                        ],
                      )
                    ),
              ),
          ),
        ],
        ),
    );
  }
  }


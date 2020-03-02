

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';



class LoginPage extends StatefulWidget {
 
  @override
   LoginPageState createState() =>  LoginPageState();
}

class  LoginPageState extends State<LoginPage> {

  String email;
  String password;

  FacebookLogin fbLogin = new FacebookLogin();



  @override
  Widget build(BuildContext context) {
    
      return new Scaffold(
        body:Builder(
        builder: (context) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
            image: new DecorationImage(
            image: new AssetImage("images/backblack.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content content here */,
              ),
        Center(
      child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                style: new TextStyle(color: Colors.white),
                decoration: InputDecoration(hintText:'Email',
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
            labelStyle: new TextStyle(
                    color: const Color(0xFFFFFFFF)),
                  
                border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                              color: Colors.white,
                            
                            ),
                          ),
                  prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                ),
                onChanged:(value){
                  setState(() {
                    email = value;  
                  });

                }
              ),
              
              
              


              SizedBox(height: 15.0),
              TextField( 
                style: new TextStyle(color: Colors.white),
                decoration: InputDecoration(hintText: 'Password',
                hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                              color: Colors.white,
                            ),
                          ),
                  prefixIcon: const Icon(
                            Icons.security,
                            color: Colors.white,
                          ),),
                
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              
              RaisedButton(
                  
                shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(90.0)),
                child: Text('Login'),
                
                color: Colors.white,
                textColor: Colors.black,
                elevation:9.0,
                
                
                onPressed:(){

                  FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email, password: password)
                    .then((AuthResult user) {
                      Navigator.of(context).pushReplacementNamed('/homepage');
                    })
                    .catchError((e){
                      print(e);
                    });

                },
                
              ),
              SizedBox(height:15.0),
              
            
              Text("Don\ 't have an account",style: TextStyle(color:Colors.white),),
              SizedBox(height: 10.0),
              RaisedButton(
                shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(90.0)),
                child: Text('Sign Up'),
                color: Colors.white,
                textColor: Colors.black,
                elevation:7.0,
                onPressed:(){
                  Navigator.of(context).pushNamed('/signup');

                },
              ),
                SizedBox(height:10.0),
              
            
              Text("Click Below Button for Google, Facebook Logins",style: TextStyle(color:Colors.white),),
              
              SizedBox(height: 10.0),
              RaisedButton(
                shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(90.0)),
                child: Text('Google Login'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation:7.0,
                onPressed:(){
                  Navigator.of(context).pushNamed('/sociallogin');

                },
              ),
              
              SizedBox(height: 10.0),
              RaisedButton(
                shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(90.0)),
                child: Text('Facebook Login'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation:7.0,
                onPressed:(){
                  Navigator.of(context).pushNamed('/facebooklogin');

                },
              ),

                
          
          


            
            ],
          ),
        ))]
        ))
        );
    
  }
}
  
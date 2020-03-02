import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Sociallogin extends StatefulWidget {
 
  @override
  
   SocialloginState createState() =>  SocialloginState();
    Widget build(BuildContext context){
      
    return new Scaffold(
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new Image.asset("images/backgl.png") 
          ]
        )
      )
    );
  }
}

class  SocialloginState extends State<Sociallogin> {

   bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
  }

  _logout(){
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        
        
        
        body: Center(
            child: _isLoggedIn
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      

                      Image.network(_googleSignIn.currentUser.photoUrl, height: 50.0, width: 50.0,),
                      Text(_googleSignIn.currentUser.displayName),
                      OutlineButton( child: Text("Logout"), onPressed: (){
                        _logout();
                      },)
                    ],
                  )
                : Center(
                  child:
                  Container(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("images/backblack.png"),
                        fit: BoxFit.cover,
                        ),),
                        child: OutlineButton(
                      child: Text("Login with Google"),
                      textColor: Colors.white,
                    
                      
                      onPressed: () {
                        _login();
                      },
                    ),
                    
                    
                    
                    
                  )
                  
          
                  
                  ),
                  
      ),
    ));



  }
}

  
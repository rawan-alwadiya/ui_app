import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String _value = '';
  String? _emailError;
  String? _passwordError;

  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late FocusNode _focusNode;

  late TapGestureRecognizer _tabGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();

    _focusNode = FocusNode();

    _tabGestureRecognizer = TapGestureRecognizer()..onTap = _tabGestureAction;
    // _tabGestureRecognizer.onTap= _tabGestureAction;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _tabGestureRecognizer.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _tabGestureAction(){
    print('Tab Gesture Action');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'LOGIN',
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
    ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back..',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            Text(
              'Enter email & password to login!',
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              focusNode: _focusNode,
              controller: _emailTextController,
              style: GoogleFonts.poppins(),
              //**************************************
              onTap: ()=>print('clicked'),
              onChanged: (String value)=>setState(()=> _value = value),
              //**************************************
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
              textAlignVertical: TextAlignVertical.center,
              textCapitalization: TextCapitalization.sentences,
              //**************************************
              textInputAction: TextInputAction.search,
              onSubmitted: (String value)=>print(value),
              //**************************************
              enabled: true,
              readOnly: false,
              //**************************************
              // cursorColor: Colors.pink,
              // cursorWidth: 5,
              // cursorRadius: Radius.circular(10),
              // cursorHeight: 50,
              // showCursor: false,
              //**************************************
              // obscureText: true,
              // obscuringCharacter: '#',
              //**************************************
              keyboardType: TextInputType.emailAddress,
              //**************************************
              maxLength: 30,
              buildCounter: (
                  BuildContext context, {
                  required int currentLength,
                  required int? maxLength,
                  required bool isFocused,
                  }){
                return isFocused? Text('$currentLength/$maxLength'): null;
              },
              //**************************************
              // minLines: 1,
              // maxLines: 4,
              //**************************************
              // minLines: null,
              // maxLines: null,
              // expands: true,
              //**************************************
              decoration: InputDecoration(
                //**************************************
                contentPadding: EdgeInsets.only(left: 10),
              //   //**************************************
              //   constraints: BoxConstraints(
              //
              //     maxHeight:_emailError != null? 70 : 50,
              //   ),
                //**************************************
                hintText: 'Email',
                hintStyle: GoogleFonts.poppins(),
                hintMaxLines: 1,
                hintTextDirection: TextDirection.ltr,
                //**************************************
                // counterText: '${_value.length}/30',
                //**************************************
                // labelText: 'Email',
                // labelStyle: GoogleFonts.poppins(),
                // floatingLabelStyle: GoogleFonts.cairo(color:Colors.black,),
                // floatingLabelBehavior: FloatingLabelBehavior.auto,
                // floatingLabelAlignment: FloatingLabelAlignment.start,
                //**************************************
                prefixIcon: const Icon(Icons.email),
                // prefixText: 'vp-',
                // prefixStyle: GoogleFonts.poppins(
                //   fontWeight: FontWeight.bold,
                // ),
                //**************************************
                // icon: Icon(Icons.email),
                //**************************************
                // suffixIcon: IconButton(
                //   icon :const Icon(Icons.send),
                //   onPressed: (){},
                // ),
                // suffixText: 'valid',
                // suffix: Text('valid'),
                // suffixStyle: GoogleFonts.poppins(),
                // //**************************************
                // helperText: 'Ex: email@app.com',
                // helperMaxLines: 1,
                // helperStyle: GoogleFonts.poppins(),
                //**************************************
                fillColor: Colors.grey,
                filled: false,
                //**************************************
                // enabled: false,
                //**************************************
                // border: InputBorder.none,
                // border: UnderlineInputBorder(
                //   borderSide: BorderSide(
                //     color:Colors.green,
                //     width: 1,
                //   ),
                // ),
                //**************************************
                //
                //**************************************
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blue.shade500,
                    width: 1,
                  ),
                ),
                //**************************************
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade700,
                    width: 1,
                  ),
                ),
                //**************************************
                errorText: _emailError,
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _passwordTextController,
              obscureText: true,
              style: GoogleFonts.nunito(),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                constraints: BoxConstraints(
                  maxHeight: _passwordError != null? 70 : 50,
                ),
                hintText: 'Password',
                hintStyle: GoogleFonts.nunito(),
                prefixIcon: Icon(Icons.lock),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blue.shade400,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade700,
                    width: 1,
                  ),
                ),
                //**************************************
                errorText: _passwordError,
              ),
              ),

            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: ()=>_performLogin(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity,50),
              ),
              child: Text('LOGIN'),
            ),
            SizedBox(height: 10,),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                text: 'Don\'t have an account',
                style: GoogleFonts.nunito(color: Colors.black,),
                children: [
                  TextSpan(text: ' '),
                  TextSpan(
                      text: 'Create Now!',
                    recognizer: _tabGestureRecognizer,
                    style: GoogleFonts.nunito(
                        color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.5,
                      decorationStyle: TextDecorationStyle.double,
                    ),
                  ),
                ],
               ),
              ),
            ),
          ],
        ),
       ),
      );

  }

  void _performLogin(){
    if(_checkData()){
      _login();
    }
  }

  bool _checkData() {
    setErrorsValues();
    if (_passwordTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Enter required data',
          style: GoogleFonts.nunito(
          color: Colors.white,
         ),
        ),
        backgroundColor: Colors.red,
        elevation: 4,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
    return false;
  }

  void setErrorsValues() {
    setState((){
     _emailError= _emailTextController.text.isEmpty? 'Enter Email' : null;
     _passwordError= _passwordTextController.text.isEmpty? 'Enter Password' : null;
    });
  }
  void _login(){
    Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yatrigan/model/user/login/user_login_req_mdl.dart';
import 'package:yatrigan/model/user/login/user_login_res_mdl.dart';
import 'package:yatrigan/model/user/signup/user_signup_req_mdl.dart';
import 'package:yatrigan/model/user/signup/user_signup_res_mdl.dart';

class UserCtrlMdl extends ChangeNotifier {
  BuildContext? context;

  UserSignupReqMdl userSignUpReq = UserSignupReqMdl();
  UserSignupResMdl? userSignUpRes;

  UserLoginReqMdl userLoginReq = UserLoginReqMdl();
  UserLoginResMdl? userLoginRes;

  bool userLogoutRes = false;
}

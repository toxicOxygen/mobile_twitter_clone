String isEmailValid(String email){
  RegExp exp = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
  if(exp.hasMatch(email))
    return null;
  return "enter a valid email";
}


String isPasswordValid(String password){
  RegExp exp = new RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
  if(exp.hasMatch(password))
    return null;
  return "password must be at least 8 characters\nat least one letter and one number";
}


String isUsernameValid(String username){
  if(username.isEmpty || username.length < 1)
    return 'enter valid username';
  return null;
}
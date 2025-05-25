import HashMap "mo:base/HashMap";
import Option "mo:base/Option";
import Text "mo:base/Text";
actor AuthSystem{
  var users = HashMap.HashMap<Text, Text>(10, Text.equal, Text.hash);

  func simpleHash(password : Text): Text{
    return Text.concat(password, "_hashed");
  };

  public func signUp(username : Text, password : Text): async Text{
    if (users.get(username) != null){
      return "User already exists.";
    }
    else {
      users.put(username , simpleHash(password));
      return "User added Successfully";
    };
  };

  public func signIn(username : Text, password : Text): async Text{
    if (users.get(username) == null){
      return "User not found";
    }
    else {
      if (Option.unwrap(users.get(username)) == simpleHash(password)){
        return "Sign In successful";
      }
      else{
        return "Sign in Failed";
      };
    };
  };
};

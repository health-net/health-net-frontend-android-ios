import 'package:flutter_test/flutter_test.dart';
import 'package:health_net_frontend_android_ios/logic/repository/user_repository/user_repository.dart';

void main() {

  group("User_repository unit tests", (){
    final UserRepository userRepo= new UserRepository();
    TestWidgetsFlutterBinding.ensureInitialized();
    test('Checking keystore data consistency after adding a key', () async{

        userRepo.setNewToken("test", "thisIsATestKey");
        String value=await userRepo.getTokenByKey("test");
        expect(value, "thisIsATestKey");
    });

    test("checking keystore data consistency after removing a key", ()async{
        userRepo.setNewToken("deleteTest", "thisIsATestKeyThatWillBeDeleted");
        userRepo.deleteTokenByKey("deleteTest");

        String value=await userRepo.getTokenByKey("deleteTest");
        expect(value, null);
    });

    test("checking keystore data consistency after updating an existing key", ()async{
        userRepo.setNewToken("updateTest", "thisIsATestKeyThatWillBeUpdated");
        userRepo.setNewToken("updateTest", "thisIsATestKeyThatHasBeenUpdated");

        expect(await userRepo.getTokenByKey("updateTest"), "thisIsATestKeyThatHasBeenUpdated");
    });

    test("checking keystore data consistency after adding several keys", ()async{
        Map<String,String> toks={
          'test1' : 'thisIsATestKey',
          'test2' : 'thisIsAnotherTestKey',
          'test3' : 'you feel like you\'re going to have a bad time',
        };

        userRepo.deleteAllExistingToken();
        userRepo.setNewToken("test1", "thisIsATestKey");
        userRepo.setNewToken("test2", "thisIsAnotherTestKey");
        userRepo.setNewToken("test3", "you feel like you\'re going to have a bad time");

        expect(await userRepo.getAllTokens(), toks);
    });


  });

}
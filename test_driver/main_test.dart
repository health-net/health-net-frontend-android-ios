import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Flutter Driver Setup', (){
    FlutterDriver flDriver;

    setUpAll(()async{
      flDriver = await FlutterDriver.connect();
    });

    tearDownAll(()async{
      if(flDriver!=null){
        await flDriver.close();
      }
    });

    test('Checking Driver\'s Health', ()async{
      Health health = await flDriver.checkHealth();
      print(health.status);
    });
  });
}
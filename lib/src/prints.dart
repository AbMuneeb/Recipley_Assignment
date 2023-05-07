import 'dart:developer';

class PrintLogs
{
  static void printLogs(dynamic data)
  {
    try{
      log(data);
    }catch(e){
      print('');
    }
  }
}
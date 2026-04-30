import 'package:http/http.dart' as http;
import 'dart:io' ; 
import 'package:command_runner/command_runner.dart';
const version = '0.0.1' ;


void main(List<String> argument) async{
  var commandRunner = CommandRunner()..addCommand(HelpCommand());
  commandRunner.run(argument);
}

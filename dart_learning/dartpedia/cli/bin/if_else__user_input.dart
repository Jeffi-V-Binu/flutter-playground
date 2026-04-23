import 'dart:io' ; 
const version = '0.0.1' ;
void searchWiki(List <String> ? arguments){
  final String articleTitle ;
  if(arguments == null || arguments.isEmpty){
    print('Please provide an article name to search for');

  articleTitle = stdin.readLineSync() ?? ''; // this is to read a single line from the input , its a synchronous menthod , ie it stops the execution until the control exits the method ie until it gets an input , it returns a nullable string .
  }
  else{
    articleTitle = arguments.join(' ');
  }
  print('searchWiki received the arguments : $articleTitle');
}
void printUsage(){
  print("These are the valid commands : 'help' , 'version' , 'search <ARTICLE NAME>'");
}
void main(List<String> argument) {
  if(argument.isEmpty || argument[0] == 'help'){
    printUsage();
  } 
  else if(argument[0] == 'version'){
    print('version : $version');
  }
  else if(argument[0] == 'search'){
    final List<String>? element = argument.length > 1 ? argument.sublist(1) : null ;
    searchWiki(element);
  }
  else{
    printUsage();
  }
}

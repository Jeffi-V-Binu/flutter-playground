import 'package:http/http.dart' as http;
import 'dart:io' ; 
const version = '0.0.1' ;

Future<String> getWikipediaArticle(String articleTitle) async
{
    final  url = Uri.http(
        'en.wikipedia.org',
        '/api/rest_v1/page/summary/$articleTitle',
    );
    final response = await http.get(url);
    if(response.statusCode == 200){
        return response.body;
    }

    return 'Failed to fetch article : ${response.statusCode}';
}


void searchWiki(List <String> ? arguments) async 
{
  final String articleTitle ;
  if(arguments == null || arguments.isEmpty){
    print('Please provide an article name to search for');
    final inputFromStdin = stdin.readLineSync() ?? ''; // this is to read a single line from the input , its a synchronous menthod , ie it stops the execution until the control exits the method ie until it gets an input , it returns a nullable string .
    if(inputFromStdin == null || inputFromStdin.isEmpty){
        print('No article name provided. Exiting search.');
        return;
    }
    articleTitle = inputFromStdin;
  }
  else{
    articleTitle = arguments.join(' ');
  }
  print('here you go >>>>');
  var articleContent = await getWikipediaArticle(articleTitle);
  print(articleContent);
}


void printUsage(){
  print("These are the valid commands : 'help' , 'version' , 'wikipedia <ARTICLE NAME>'");
}


void main(List<String> argument) {
  if(argument.isEmpty || argument[0] == 'help'){
    printUsage();
  } 
  else if(argument[0] == 'version'){
    print('version : $version');
  }
  else if(argument[0] == 'wikipedia'){
    final List<String>? element = argument.length > 1 ? argument.sublist(1) : null ;
    searchWiki(element);
  }
  else{
    printUsage();
  }
}

import 'dart:async';
import 'argument.dart';

class HelpCommand extends Command {
    HelpCommand(){
        addFlag(
            'verbose',
            abbr: 'v',
            help: 'When true this command will print each command and its options.',
        );
        addOption(
            'command',
            abbr: 'c',
            help: 'When this command is passed as an argument , prints only that command`s verbose usage.',
        );
    }

    @override
    String get name => 'help';

    @override
    String get description => 'Prints usage info to the command line';

    @override
    String? get help => 'Prints this usage info';

    @override 
    FutureOr<Object?> run (ArgResults args) async {
        var usage = runner.usage;
        for(var command in runner.commands){
            usage += '\n ${command.usage}';
        }
        return usage;
    }
}
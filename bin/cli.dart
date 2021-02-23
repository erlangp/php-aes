import 'package:cli/cli.dart' as cli;
import 'dart:convert';
import 'dart:io';
import 'dart:math' show Random;

void main(List<String> arguments) {
  print('Hello world!');

  envv();
  plt();

  print('Searching...');
  var res = Process.runSync(
    // '/usr/bin/which',
    // ['php'],
    'find',
    ['/Users', '-name', '"artisan"'],
    includeParentEnvironment: true,
    stdoutEncoding: Encoding.getByName('utf-8'),
    stderrEncoding: Encoding.getByName('utf-8'),
  );
  print(res.stderr.toString());
  print(res.stdout.toString());
  print('Done.');
  String input = stdin.readLineSync();
}

void envv() {
  final envVarMap = Platform.environment;
  print('ENV PWD=${envVarMap["PWD"]}');
  print('ENV LOGNAME=${envVarMap["LOGNAME"]}');
  print('ENV PATH=${envVarMap["PATH"]}');
}

void plt() {
  print("Platform.executableArguments" +
      '=' +
      Platform.executableArguments.toString());
  print("Platform.executable" + '=' + Platform.executable);
  print("Platform.isAndroid" + '=' + Platform.isAndroid.toString());
  print("Platform.isFuchsia" + '=' + Platform.isFuchsia.toString());
  print("Platform.isIOS" + '=' + Platform.isIOS.toString());
  print("Platform.isLinux" + '=' + Platform.isLinux.toString());
  print("Platform.isMacOS" + '=' + Platform.isMacOS.toString());
  print("Platform.isWindows" + '=' + Platform.isWindows.toString());
  print("Platform.localHostname" + '=' + Platform.localHostname);
  print("Platform.localeName" + '=' + Platform.localeName);
  print("Platform.numberOfProcessors" +
      '=' +
      Platform.numberOfProcessors.toString());
  print("Platform.operatingSystem" + '=' + Platform.operatingSystem);
  print("Platform.operatingSystemVersion" +
      '=' +
      Platform.operatingSystemVersion);
  print("Platform.packageConfig" + '=' + Platform.packageConfig.toString());
  print("Platform.pathSeparator" + '=' + Platform.pathSeparator);
  print("Platform.resolvedExecutable" + '=' + Platform.resolvedExecutable);
  print("Platform.script" + '=' + Platform.script.toString());
  print("Platform.version" + '=' + Platform.version);
}
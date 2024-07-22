import 'package:file_encrypt/application/bloc/authentication/auth_bloc.dart';
import 'package:file_encrypt/application/bloc/authentication/auth_state.dart';
import 'package:file_encrypt/ui/screens/auth/pin_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logs/flutter_logs.dart';

import 'package:file_encrypt/application/bloc/encryption/encryption_bloc.dart';
import 'package:file_encrypt/core/database/objectbox.dart';
import 'package:file_encrypt/core/utils/logger.dart';
import 'package:file_encrypt/ui/screens/home_screen.dart';

late final ObjectBoxAdapter objectbox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterLogs.initLogs(
    logLevelsEnabled: [
      LogLevel.INFO,
      LogLevel.WARNING,
      LogLevel.ERROR,
      LogLevel.SEVERE
    ],
    timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
    directoryStructure: DirectoryStructure.FOR_DATE,
    logTypesEnabled: [
      "device",
      "encryption",
      "image access",
      "errors",
      "authentication"
    ],
    logFileExtension: LogFileExtension.LOG,
    logsWriteDirectoryName: "AppLogs",
    logsExportDirectoryName: "AppLogs/Exported",
    debugFileOperations: true,
    isDebuggable: true,
  );

  FlutterLogs.logInfo("App Start", DateTime.now().toIso8601String(), "");
  objectbox = await ObjectBoxAdapter.create();
  // Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => EncryptionBloc(objectBoxAdapter: objectbox),
        ),
        BlocProvider(lazy: false, create: (context) => AuthBloc())
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: BlocConsumer<AuthBloc, AuthBlocState>(
          listener: (context, state) {
            if (state.isAuthenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            }
          },
          builder: (context, state) {
            return const PinInputScreen();
          },
        ),
      ),
    );
  }
}

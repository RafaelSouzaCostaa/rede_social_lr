import 'package:flutter/material.dart';
import 'package:rede_social_lr/Screens/ScreenSettings/screen_settings.dart';

import 'Screens/ScreenHome/screen_home.dart';
import 'Screens/ScreenLogin/screen_login.dart';
import 'Screens/ScreenRegistration/screen_registration.dart';
import 'Screens/ScreenSplash/screen_splash.dart';
import 'Screens/ScreenPerfil/screen_perfil.dart';
import 'Screens/screen_teste.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'RedeSocial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/teste',
      routes: {
        '/splash': (context) => const ScreenSplash(),
        '/home': (context) => const ScreenHome(),
        "/cadastro": (context) => const ScreenRegistration(),
        "/login": (context) => const ScreenLogin(),
        "/perfil": (context) => const ScreenPerfil(),
        "/setting": (context) => const ScreenSettings(),
        "/teste": (context) => const Testes(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}

//ATENCAO APENAS TAGS GIT E INFOS

//CUIDADOS AO IMPORTAR ARQUIVOS PROPRIOS, NÃO IMPORTAR COM "PACKAGE:" IMPORTAR DA MANEIRA TRADICIONAL "../PASTA/ARQUIVO.DART",
//ISSO VAI EVITAR UMA GRANDE DOR DE CABEÇA DEPOIS;

/*
ci: para algo que você mexa na Integração Contínua dele.
build: mais específicos para tarefas de build.
feat: que serve para novas features que você adicionar.
fix: o nome já diz, serve para você corrigir algum fodasse lá.
docs: mais um fácil, para algo relacionado a documentações, README e afins.
style: mexeu no estilo, CSS? Manda brasa então nesse cara.
refactor: precisou alterar, melhorar algum fodasse? É esse caboclo aqui.
perf: quando você mexer em algo relacionado a performance, fique à vontade em usar esse aqui.
test: para testes, ok?
chore: geralmente o mais emblemático. Serve para coisas relacionados a build, configs e afins. Por exemplo, mexeu em algo no package.json? Use esse cara, seja atualizando a versão do pacote ou instalando novas dependências
revert: Finalmente algum para eu explicar. O nome já diz o que é, certo? Caso você precise fazer um revert, manda ver nesse prefixo.
*/


//IMPLEMENTAR  Utilizar o GETX EcoSystem 
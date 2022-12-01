import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'pt_BR': {
          'language': "Português",
          'user': 'Usuario',
          'name': 'Nome',
          'nickname': 'Apelido',
          'password': 'Senha',
          'posts': 'Postagens',
          'likes': 'Curtidas',
          'followers': 'Seguidores',
          'following': 'Seguindo',
          'nullaccount': 'Não tem uma conta? ',
          'register': 'Cadastre-se',
          'forgotpassword': 'Esqueceu sua senha? ',
          'alreadyhaveaccount': 'Ja tem uma conta? ',
          'recover': 'Recuperar',
          'profile': 'Perfil',
          'change': 'Alterar',
          'logout': 'Sair',
          'anygossip': 'Alguma fofoca?',
          'required': 'Campo Obrigatorio',
          'login': 'Entrar',
          'loginError': 'Erro ao fazer login',
          'validData': 'Insira dados validos'
        },
        'en_US': {
          'language': "English",
          'user': 'User',
          'name': 'Name',
          'nickname': 'Nickname',
          'password': 'Password',
          'posts': 'Posts',
          'likes': 'Likes',
          'followers': 'Followers',
          'following': 'Following',
          'nullaccount': 'Dont have an account? ',
          'register': 'Register',
          'forgotpassword': 'Forgot your password? ',
          'alreadyhaveaccount': 'Already have an account? ',
          'recover': 'Recover',
          'profile': 'Profile',
          'change': 'Change',
          'logout': 'Logout',
          'anygossip': 'Any gossip?',
          'required': "Required Field",
          'login': "Login",
          'loginError': 'Error on: logging in',
          'validData': 'Enter valid data'
        },
      };
}

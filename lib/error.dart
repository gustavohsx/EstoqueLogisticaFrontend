class Error {
  var errorMessage = {
    "Failed to authenticate":
        "Informações de Login Incorretas. Verifique o Endereço do Servidor, Usuário e a Senha!",
    "The requested resource wasn't found": "Produto Não foi Encontrado!",
    "-1": 'Consulta Pela Câmera Cancelada pelo Usuário!'
  };

  searchError(String message) {
    return errorMessage[message] ?? 'Consulte o Suporte!';
  }
}

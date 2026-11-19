import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Tela que hospeda o agente Conversational AI do Dialogflow dentro do aplicativo.
// O Flutter cria e controla o WebView, enquanto a página HTML renderiza o chatbot.
class DialogflowChatPage extends StatefulWidget {
  const DialogflowChatPage({super.key});

  @override
  State<DialogflowChatPage> createState() => _DialogflowChatPageState();
}

class _DialogflowChatPageState extends State<DialogflowChatPage> {
  // Controlador do WebView: usado para configurar JavaScript, navegação e conteúdo HTML.
  late final WebViewController _controller;

  // Conteúdo HTML carregado pelo WebView.
  // - bootstrap.js: importa o componente oficial do Dialogflow Messenger.
  // - df-messenger: cria a janela do chatbot e identifica o agente pelo agent-id.
  // - intent="WELCOME": inicia a conversa com a saudação configurada no agente.
  // - expand="true": abre o chat automaticamente ao entrar na tela.
  final String _htmlContent = '''
  <!DOCTYPE html>
  <html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Biblioteca oficial que fornece o componente visual e a comunicação com o agente. -->
    <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>

    <style>
      /* Remove margens externas para o chatbot ocupar toda a tela. */
      body { margin: 0; padding: 0; }

      /* Personaliza as cores das mensagens e da barra superior do chatbot. */
      df-messenger {
        --df-messenger-bot-message: #e0e0e0;
        --df-messenger-button-titlebar-color: #0A6D8E;
      }
    </style>
  </head>
  <body>
    <df-messenger
      intent="WELCOME"
      chat-title="Todos Por Um Chatbot"
      agent-id="5b737b30-d2b2-4c9f-ad08-23768343f282"
      language-code="pt-br"
      expand="true"
    ></df-messenger>

    <script>
      // Quando o usuário fechar o chat pelo componente do Dialogflow, o JavaScript
      // envia uma mensagem para o canal registrado no Flutter. Isso permite que
      // a tela nativa seja fechada e o usuário volte à tela anterior.
      window.addEventListener('DOMContentLoaded', () => {
        const messenger = document.querySelector('df-messenger');
        if (!messenger) return;

        messenger.addEventListener('df-messenger-chat-closed', () => {
          if (window.CloseChatDialog) {
            window.CloseChatDialog.postMessage('close');
          }
        });
      });
    </script>
  </body>
  </html>
  ''';

  // Fecha a página atual e devolve o usuário à tela anterior do aplicativo.
  void _fecharChat() {
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();

    // Configura o WebView responsável pela comunicação com o Dialogflow Messenger.
    _controller = WebViewController()
      // Permite executar o JavaScript necessário para carregar o chatbot.
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      // Canal usado pelo HTML para solicitar o fechamento da tela ao Flutter.
      ..addJavaScriptChannel(
        'CloseChatDialog',
        onMessageReceived: (message) => _fecharChat(),
      )
      // Mantém a navegação dentro da página carregada.
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) => NavigationDecision.navigate,
        ),
      )
      // Carrega o HTML diretamente na memória, usando o domínio do Dialogflow
      // como base para scripts, recursos e eventos de segurança do WebView.
      ..loadHtmlString(_htmlContent, baseUrl: 'https://www.gstatic.com');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // A principal tela do chatbot fica abaixo dos controles da interface.
            WebViewWidget(controller: _controller),

            // Botão externo de fechar, criado pelo Flutter para garantir que o
            // controle permaneça sempre visível mesmo quando o componente interno
            // do Dialogflow não apresenta o seu próprio botão de fechamento.
            Positioned(
              top: 12,
              right: 12,
              child: Material(
                color: Colors.white,
                shape: const CircleBorder(),
                elevation: 4,
                child: IconButton(
                  tooltip: 'Fechar chat',
                  onPressed: _fecharChat,
                  icon: const Icon(Icons.close_rounded, size: 24),
                  color: const Color(0xFF0A6D8E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

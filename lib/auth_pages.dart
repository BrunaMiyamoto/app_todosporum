import 'package:flutter/material.dart';

const _authBlue = Color(0xFF0A6D8E);
const _authOrange = Color(0xFFF28A2F);
const _authBackground = Color(0xFFEAF3F5);

void _returnHome(BuildContext context) {
  Navigator.of(context).popUntil((route) => route.isFirst);
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _keepConnected = false;
  bool _hidePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      _showMessage('A autenticação ainda não está disponível.');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _authBackground,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 48,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 460),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          onPressed: () => _returnHome(context),
                          icon: const Icon(Icons.home_outlined),
                          label: const Text('Voltar para início'),
                        ),
                      ),
                      Container(
                        width: 112,
                        height: 112,
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/img/logoIcone.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Bem-vindo(a)!',
                        style: TextStyle(
                          color: _authBlue,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Entre na sua conta Todos Por Um',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      _AuthCard(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _AuthField(
                                label: 'E-mail',
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: _validateEmail,
                              ),
                              const SizedBox(height: 18),
                              _AuthField(
                                label: 'Senha',
                                controller: _passwordController,
                                obscureText: _hidePassword,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                    ? 'Informe sua senha.'
                                    : null,
                                suffixIcon: IconButton(
                                  tooltip: _hidePassword
                                      ? 'Mostrar senha'
                                      : 'Ocultar senha',
                                  onPressed: () => setState(
                                    () => _hidePassword = !_hidePassword,
                                  ),
                                  icon: Icon(
                                    _hidePassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 8,
                                runSpacing: 4,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        value: _keepConnected,
                                        activeColor: _authBlue,
                                        onChanged: (value) => setState(
                                          () => _keepConnected = value ?? false,
                                        ),
                                      ),
                                      const Text('Manter conectado'),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (_) => const SignupPage(),
                                      ),
                                    ),
                                    child: const Text(
                                      'Primeiro acesso? Cadastre-se',
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () => _showMessage(
                                        'A recuperação de senha estará disponível em breve.',
                                      ),
                                      child: const Text('Esqueceu sua senha?'),
                                    ),
                                    const SizedBox(width: 8),
                                    FilledButton(
                                      onPressed: _login,
                                      style: FilledButton.styleFrom(
                                        backgroundColor: _authBlue,
                                        foregroundColor: Colors.white,
                                      ),
                                      child: const Text('ENTRAR'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _shareData = false;
  bool _acceptTerms = false;
  bool _hidePassword = true;
  bool _hideConfirmation = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Aceite os Termos de Serviço para continuar.'),
        ),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Cadastro preenchido. A criação de contas estará disponível em breve.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _authBackground,
      appBar: AppBar(
        title: const Text('Criar conta'),
        centerTitle: true,
        backgroundColor: _authBackground,
        foregroundColor: _authBlue,
        actions: [
          TextButton.icon(
            onPressed: () => _returnHome(context),
            icon: const Icon(Icons.home_outlined),
            label: const Text('Início'),
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 620),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Faça seu cadastro',
                      style: TextStyle(
                        color: _authOrange,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Preencha seus dados para criar sua conta. Os campos marcados com * são obrigatórios.',
                    ),
                    const SizedBox(height: 22),
                    const _SectionHeading('Dados pessoais'),
                    const SizedBox(height: 12),
                    _AuthField(
                      label: 'Nome completo *',
                      validator: _requiredValidator(
                        'Informe seu nome completo.',
                      ),
                      textCapitalization: TextCapitalization.words,
                    ),
                    const SizedBox(height: 14),
                    const _AuthField(
                      label: 'Nome social',
                      textCapitalization: TextCapitalization.words,
                    ),
                    const SizedBox(height: 14),
                    _AuthField(
                      label: 'E-mail *',
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 14),
                    _AuthField(
                      label: 'Número de telefone *',
                      keyboardType: TextInputType.phone,
                      validator: _requiredValidator('Informe seu telefone.'),
                    ),
                    const SizedBox(height: 14),
                    _AuthField(
                      label: 'Data de nascimento *',
                      hintText: 'DD/MM/AAAA',
                      keyboardType: TextInputType.datetime,
                      validator: _requiredValidator(
                        'Informe sua data de nascimento.',
                      ),
                    ),
                    const SizedBox(height: 14),
                    _AuthField(
                      label: 'CPF *',
                      keyboardType: TextInputType.number,
                      validator: _requiredValidator('Informe seu CPF.'),
                    ),
                    const SizedBox(height: 22),
                    const _SectionHeading('Dados do perfil'),
                    const SizedBox(height: 12),
                    _AuthField(
                      label: 'Senha *',
                      controller: _passwordController,
                      obscureText: _hidePassword,
                      validator: (value) => value == null || value.length < 6
                          ? 'A senha deve ter pelo menos 6 caracteres.'
                          : null,
                      suffixIcon: IconButton(
                        tooltip: _hidePassword
                            ? 'Mostrar senha'
                            : 'Ocultar senha',
                        onPressed: () =>
                            setState(() => _hidePassword = !_hidePassword),
                        icon: Icon(
                          _hidePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    _AuthField(
                      label: 'Confirme sua senha *',
                      controller: _confirmPasswordController,
                      obscureText: _hideConfirmation,
                      validator: (value) => value != _passwordController.text
                          ? 'As senhas não conferem.'
                          : null,
                      suffixIcon: IconButton(
                        tooltip: _hideConfirmation
                            ? 'Mostrar senha'
                            : 'Ocultar senha',
                        onPressed: () => setState(
                          () => _hideConfirmation = !_hideConfirmation,
                        ),
                        icon: Icon(
                          _hideConfirmation
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: _shareData,
                      activeColor: _authBlue,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text(
                        'Concordo em compartilhar meus dados com a equipe Todos Por Um.',
                      ),
                      onChanged: (value) =>
                          setState(() => _shareData = value ?? false),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: _acceptTerms,
                      activeColor: _authBlue,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text(
                        'Li e concordo com os Termos de Serviço da comunidade.',
                      ),
                      onChanged: (value) =>
                          setState(() => _acceptTerms = value ?? false),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (_) => const LoginPage(),
                            ),
                          ),
                          child: const Text('Já tem uma conta? Faça login.'),
                        ),
                        Wrap(
                          spacing: 10,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                _formKey.currentState!.reset();
                                _passwordController.clear();
                                _confirmPasswordController.clear();
                                setState(() {
                                  _shareData = false;
                                  _acceptTerms = false;
                                });
                              },
                              child: const Text('Limpar'),
                            ),
                            FilledButton(
                              onPressed: _submit,
                              style: FilledButton.styleFrom(
                                backgroundColor: _authBlue,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Criar minha conta'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthCard extends StatelessWidget {
  const _AuthCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(padding: const EdgeInsets.all(22), child: child),
    );
  }
}

class _AuthField extends StatelessWidget {
  const _AuthField({
    required this.label,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.hintText,
    this.textCapitalization = TextCapitalization.none,
  });

  final String label;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? hintText;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        filled: true,
        fillColor: _authBackground,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _authBlue, width: 1.5),
        ),
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: _authOrange,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

FormFieldValidator<String> _requiredValidator(String message) {
  return (value) => value == null || value.trim().isEmpty ? message : null;
}

String? _validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) return 'Informe seu e-mail.';
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value.trim())) {
    return 'Informe um e-mail válido.';
  }
  return null;
}

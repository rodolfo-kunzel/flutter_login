import 'package:flutter/material.dart';

class AgreementText extends StatelessWidget {
  const AgreementText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Ao se registar, você concorda com os ',
        style: Theme.of(context).textTheme.displayMedium,
        children: [
          TextSpan(
              text: 'Termos de Serviço',
              style: Theme.of(context).textTheme.labelMedium),
          TextSpan(
            text: ' e a ',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          TextSpan(
              text: 'Política de Privacidade',
              style: Theme.of(context).textTheme.labelMedium),
          TextSpan(
            text: ' da Tecnofit.',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}

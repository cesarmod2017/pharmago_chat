import 'package:flutter/material.dart';

import 'chat_page.dart';
import 'rag_page.dart';
import 'support_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PharmaGO Chat Suite'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Selecionar Modulo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            _ModuleCard(
              icon: Icons.chat,
              color: Colors.blue,
              title: 'Chat',
              description: 'Chatbot com IA',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatPage()),
              ),
            ),
            const SizedBox(height: 16),
            _ModuleCard(
              icon: Icons.library_books,
              color: Colors.green,
              title: 'Base de Conhecimento',
              description: 'Gerenciamento e busca de documentos',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RagPage()),
              ),
            ),
            const SizedBox(height: 16),
            _ModuleCard(
              icon: Icons.support_agent,
              color: Colors.orange,
              title: 'Suporte',
              description: 'Transferencia para suporte humano',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SupportPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _ModuleCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: color.withValues(alpha: 0.1),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

# Documentação do Banco de Dados

## Visão Geral
Este banco de dados foi projetado para gerenciar um sistema de controle de pedidos, incluindo consumidores, carrinhos de compras, produtos, pedidos e pagamentos. A estrutura foi organizada de forma a garantir integridade referencial e facilitar operações essenciais, como gestão de pedidos e processamento de pagamentos.

---

## Banco de Dados Relacional (SQL)

### Justificativa:
- O sistema possui relacionamentos complexos entre entidades (ex: `consumer`, `orders`, `cart`, `product`), que são melhor gerenciados em um banco de dados relacional.
- A consistência dos dados é crítica (ex: garantir que um pedido não seja processado sem pagamento), e bancos relacionais oferecem transações ACID (conjunto de regras que buscam garantir a validade dos dados no caso de algo dar errado durante uma transação).
- A estrutura do banco de dados é bem definida e estável, o que se alinha com a natureza de um banco relacional.
- Consultas complexas (ex: relatórios de vendas, histórico de pedidos) são mais eficientes em bancos relacionais.

---

## Banco de Dados Gerenciável (AWS RDS)

### Justificativa:
- Bancos gerenciáveis oferecem alta disponibilidade, backups automáticos e escalabilidade, o que é essencial para um sistema de fast food que pode crescer rapidamente.
- Reduz a carga operacional (ex: tarefas de gerenciamento e manutenção automatizadas).

---

## DynamoDB para a autenticação do usuário com Lambda

### Justificativa:
Optamos por utilizar o AWS DynamoDB como banco de dados para armazenar o CPF e o ID do usuário devido a uma série de vantagens que se alinham com os requisitos do nosso caso de uso:

- O DynamoDB oferece consultas extremamente rápidas, o que é ideal para operações de leitura frequente como a autenticação de usuários por CPF. Isso garante uma experiência rápida e eficiente para o usuário final.
- Por ser um serviço gerenciado, o DynamoDB elimina a necessidade de manutenção de servidores ou preocupações com escalabilidade. Isso é especialmente vantajoso em ambientes serverless com API Gateway e AWS Lambda, onde a demanda pode variar bastante.
- O acesso ao dado de autenticação é feito diretamente por CPF, o que se encaixa perfeitamente com o modelo de chave-partição do DynamoDB. Isso permite consultas diretas, sem necessidade de índices complexos ou joins.
- O DynamoDB se integra de forma simples e eficiente com funções Lambda, possibilitando uma arquitetura totalmente serverless, de fácil manutenção e baixo custo operacional.
- O DynamoDB distribui automaticamente os dados em múltiplas zonas de disponibilidade, garantindo resiliência e alta disponibilidade sem necessidade de configuração adicional.
- Com o uso de políticas do IAM, é possível restringir o acesso aos dados sensíveis (como o CPF), garantindo conformidade com práticas de segurança e privacidade.

---

## MongoDB para catálogos de produtos

### Justificativa:
Optamos pelo MongoDB devido à sua flexibilidade de schema, que se adapta perfeitamente a cenários com estruturas de dados dinâmicas, como catálogos de produtos que se alinham com os requisitos do nosso caso de uso:

- Cada item pode ter atributos distintos — por exemplo, refrigerantes possuem volume (ml), enquanto hambúrgueres são vendidos por unidade com variações de montagem.
- No MongoDB, cada documento é independente e armazena exatamente o que precisa, sem sobrecarga estrutural.
---

## Justificativa do Design

### Normalização:
- O esquema evita redundâncias e garante integridade referencial.

### Relacionamentos de Chave Estrangeira:
- **Consumer → Orders**: Um consumidor pode ter vários pedidos.
- **Orders → Cart**: Cada pedido está associado a um carrinho.
- **Orders → Payment**: Cada pedido tem um pagamento único.
- **Cart → Cart_Item**: Um carrinho pode ter vários itens.
- **Cart_Item → Product**: Cada item do carrinho está vinculado a um produto.
- **Payment → Webhook_Payment**: O histórico do status dos pagamentos.

### Uso de Índices:
- Índices são utilizados para otimizar buscas.

### Modularidade:
- As tabelas são separadas conforme suas responsabilidades, permitindo fácil manutenção e escalabilidade.

### Histórico de Pagamentos:
- A tabela `webhook_payment` registra mudanças no status dos pagamentos, útil para auditoria.

---

## Estrutura do Banco de Dados

### Tabelas Principais:
1. **Consumer**: Armazena informações dos consumidores.
2. **Orders**: Registra os pedidos feitos pelos consumidores.
3. **Cart**: Gerencia os carrinhos de compras.
4. **Cart_Item**: Itens presentes no carrinho.
6. **Order_Item**: Itens associados a um pedido.
7. **Payment**: Informações de pagamento dos pedidos.
9. **Webhook_Payment**: Histórico de status dos pagamentos.

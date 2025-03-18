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

## Justificativa do Design

### Normalização:
- O esquema evita redundâncias e garante integridade referencial.

### Relacionamentos de Chave Estrangeira:
- **Consumer → Orders**: Um consumidor pode ter vários pedidos.
- **Orders → Cart**: Cada pedido está associado a um carrinho.
- **Orders → Payment**: Cada pedido tem um pagamento único.
- **Cart → Cart_Item**: Um carrinho pode ter vários itens.
- **Cart_Item → Product**: Cada item do carrinho está vinculado a um produto.
- **Orders → Order_Item**: Um pedido pode ter múltiplos itens.
- **Order_Item → Product**: Cada item do pedido refere-se a um produto.
- **Product → Product_Images**: Cada produto pode ter múltiplas imagens.
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
5. **Product**: Dados dos produtos disponíveis.
6. **Order_Item**: Itens associados a um pedido.
7. **Payment**: Informações de pagamento dos pedidos.
8. **Product_Images**: Imagens relacionadas aos produtos.
9. **Webhook_Payment**: Histórico de status dos pagamentos.

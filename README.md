
# Infra estrutura do banco de dados em postgress AWS.
Este repositório contém uma infraestrutura como código (IaC) como parte da Fase 3 da Pós-tech em Software Architecture da FIAP. O projeto realiza a criação de um banco de dados PostgreSQL utilizando AWS RDS.

## ✳️ Sobre
- [Justificativa](/docs/Justificativa.md)
- [Diagrama de Entidade e Relacionado](/docs/der.jpeg)

---

## Tecnologias Utilizadas

- **AWS IAM** - Controle de permissões
- **Terraform** - Infraestrutura como código (IaC)

---

## Como Rodar Localmente

### 1. Configuração Inicial

Certifique-se de ter o **Terraform** e o **AWS CLI** instalados e configurados.

### 2. Clonar o repositório

```sh
 git clone https://github.com/9SOAT/eks-db-tf
```

### 3. Configurar credenciais da AWS

Se ainda não configurou suas credenciais AWS, faça:

```sh
 aws configure
```

E informe:
- **AWS Access Key ID**
- **AWS Secret Access Key**
- **Região AWS** (exemplo: `us-east-1`)

### 4. Execute os seguintes comandos

```sh
 #inicia o backend terraform
 terraform init
   
 #valida o código terraform
 terraform validate
   
 #faz um plano do deploy
 terraform plan
  
 #aplica o deploy
 terraform apply -auto-approve
  

```

### 5. Excluir o serviço criado use o seguinte comando


```sh
 #destroi o deploy
 terraform destroy -auto-approve
```

---


## Deploy com Terraform

O Terraform gerencia o deploy, o armazenamento no **S3**, permissões **IAM** e a configuração do **API Gateway**.

---

## Estrutura do Repositório

```
/
└── .github/workflows/     
    ├── terraform.yaml    # CI/CD para deploy a na AWS quando um pull request é mergeado na main
    └── destroy.yaml      # Workflow para excluir o serviço na AWS
├── docs/                 # Documentos
    ├──  der.jpeg         # Diagrama de entidade e relacionamento da estrutura de banco de dados
    ├──  Justificativa.md # Justificativa do banco de dados
├── terraform/            # Terraform para infraestrutura
    ├──  backend.tf       # Configuração
    ├──  main.tf          # Configuração
    ├──  outputs.tf       # Configuração
    ├──  provider.tf      # Configuração
├── README.md             # Documentação
├── .gitignore            # Arquivos ignorados no Git
```

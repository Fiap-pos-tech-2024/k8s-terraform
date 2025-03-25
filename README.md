# Fast Food API - Kubernetes Deployment

Este projeto contém os manifestos Kubernetes e configurações Terraform para implantar a aplicação **Fast Food API** em um cluster Kubernetes.

## Estrutura do Projeto

- **main.tf**: Configuração Terraform para gerenciar os recursos Kubernetes.
- **k8s-manifests/**: Diretório contendo os manifestos Kubernetes:
  - `service.yaml`: Configuração do Service para expor a aplicação.
  - `deployment.yaml`: Configuração do Deployment para gerenciar os pods da aplicação.
  - `mongo-deployment.yaml`: Configuração do Deployment para o banco de dados MongoDB.
  - `mongo-service.yaml`: Configuração do Service para o MongoDB.
  - `secret.yaml`: Configuração de segredos para o MongoDB.
  - `configmap.yaml`: Configuração de variáveis de ambiente para a aplicação.
  - `hpa.yaml`: Configuração do Horizontal Pod Autoscaler.

## Pré-requisitos

- Kubernetes instalado e configurado.
- Terraform instalado.
- Um cluster Kubernetes em execução (ex.: Minikube, Kind, ou outro provedor).

## Passos para Implantação

1. **Iniciar o cluster Kubernetes**:
   Certifique-se de que seu cluster Kubernetes está em execução. Por exemplo, com Minikube:

   ```bash
   minikube start
   ```

2. **Aplicar os manifestos Kubernetes**:
   Use o Terraform para aplicar os recursos:

   ```bash
   terraform init
   terraform apply
   ```

3. **Expor a aplicação localmente**:
   Para acessar a aplicação localmente, execute o comando abaixo para redirecionar a porta:

   ```bash
   kubectl port-forward --address 0.0.0.0 -n default service/fast-food-service 30001:3000
   ```

   Isso fará com que a aplicação esteja acessível em `http://localhost:30001`.

4. **Testar a aplicação**:
   Acesse a aplicação no navegador ou use ferramentas como `curl` para verificar se está funcionando:
   ```bash
   curl http://localhost:30001
   ```

## Observações

- Certifique-se de que o arquivo `~/.kube/config` está configurado corretamente para se conectar ao cluster Kubernetes.
- Ajuste as configurações de porta no arquivo `service.yaml` ou no comando `kubectl port-forward` conforme necessário.

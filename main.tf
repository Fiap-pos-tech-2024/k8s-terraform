terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.20.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"  # Ajuste se necessário para o seu kubeconfig
}

resource "kubernetes_namespace" "default" {
  metadata {
    name = "default"
  }

  lifecycle {
    ignore_changes = [metadata]
  }
}

resource "kubernetes_manifest" "fast_food_service" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/service.yaml"))
}

resource "kubernetes_manifest" "mongodb_secret" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/secret.yaml"))
}

resource "kubernetes_manifest" "mongo_service" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/mongo-service.yaml"))
}

resource "kubernetes_manifest" "mongo_deployment" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/mongo-deployment.yaml"))
}

resource "kubernetes_manifest" "fast_food_hpa" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/hpa.yaml"))
}

resource "kubernetes_manifest" "fast_food_deployment" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/deployment.yaml"))
}

resource "kubernetes_manifest" "fast_food_configmap" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/configmap.yaml"))
}

# CI/CD aws pipeline

Deploy node js app by using aws pipeline and aws ecs.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

1. CloudFormation: Provision all aws resources for CI/CD.
2. AMI: grant access to resources.
3. CloudWatch: Watch pipeline and codebuild changes trigger lambda call.
4. Lambda: Call slack API send message to slack channel.
5. Pipeline : Orchestrate CI/CD workflow.
6. Codebuild: Run test and build docker images.
7. ECR: Upload images into ECR.
8. ECS: Deploy docker conainter.

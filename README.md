# CI/CD pipeline for node app

Deploy node js app by using AWS Pipleline and ECS Fargate

## Pipeline Architecture
![](images/architecture.png)

## Getting Started

1. Provision vpc if does not exist.
2. Provision ecs_load_balancer. 
3. Provision ecs_service.
4. Provision pipeline_dev.
5. Provision s3 to store lambda source code.
6. Provision lambda.


### Prerequisites

1. CloudFormation: Provision all aws resources for CI/CD.
2. AMI: grant access to resources.
3. CloudWatch: Watch pipeline and codebuild changes trigger lambda call.
4. Lambda: Call slack API send message to slack channel.
5. Pipeline : Orchestrate CI/CD workflow.
6. Codebuild: Run test and build docker images.
7. ECR: Upload images into ECR.
8. ECS: Deploy docker conainter.


### Parameters need to configure

1. AWS info.
1. Github info.
2. Slack webhook url.
3. ECR info.


### Notes

1. VPC Security group need to allow tcp to access contianer app. Custom TCP Rule TCP (6) 8081 0.0.0.0/0
2. Need a script file to provision all resources.



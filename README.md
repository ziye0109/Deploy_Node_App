Deploy node js app by using aws pipeline and aws ecs.  

AWS Resources need for pipeline:
1. CloudFormation: Provision all aws resources for CI/CD
2. CloudWatch: Watch pipeline and codebuild changes trigger lambda call.
3. Lambda: Call slack API send message to slack channel.
4. Pipeline : orchestrate CI/CD workflow.
5. Codebuild: run test and build docker images.
6. ECS: run docker conainter.




Deploy node js app by using aws pipeline and aws ecs.  

AWS Resources need for pipeline:
1. CloudFormation: Provision all aws resources for CI/CD
2. CloudWatch: Watch pipeline and codebuild changes trigger lambda call.
3. Lambda: Call slack API send message to slack channel.
4. Pipeline : Orchestrate CI/CD workflow.
5. Codebuild: Run test and build docker images.
6. ECS: Deploy docker conainter.





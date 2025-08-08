
#Static webpage deploy

A brief description of what this project does and who it's for

Overview

   1)his project demonstrates the deployment of a static HTML website using Docker and Nginx, hosted on AWS ECS with Fargate.

   2)The build and deployment are automated using AWS CodePipeline and AWS CodeBuild, with Amazon ECR used for container image storage.

**Deployment Architecture**
    1)Code is pushed to the GitHub repository.

    2)AWS CodePipeline detects the change and triggers AWS CodeBuild.

    3)CodeBuild builds the Docker image and pushes it to Amazon ECR.

    4)AWS ECS Service (Fargate launch type) pulls the image from ECR and runs the container.

    5)The application is served via Nginx and made accessible through a custom domain.

**Requirements**

   1)AWS account

   2)Docker installed locally

   3)AWS CLI configured

   4)GitHub repository connected to AWS CodePipeline

**Project Files**

   1)index.html – Static website HTML file

   2)Dockerfile – Docker build instructions for Nginx container

   3)nginx.conf – Nginx server configuration

   4)buildspec.yml – AWS CodeBuild build specification

   5)README.md – Project documentation

**Build and Deployment Process**

  1)Clone the repository locally.

  2)Modify the index.html file as needed.

  3)Commit and push changes to GitHub.

  4)AWS CodePipeline automatically triggers the build and deployment.

  5)ECS Service updates the running container with the new image.

**CI/CD Flow**

1)Developer commits code to GitHub repository.

2)CodePipeline detects changes and triggers CodeBuild.

3)CodeBuild executes buildspec.yml

4)Build the Docker image.

5)Tag the image with latest and commit hash.

6)Push the image to ECR.

7)CodePipeline ECS Deploy Action updates ECS service with the new image tag.

8)ECS stops old tasks and starts new ones running the updated container.

**IAM Roles and Policies Used**

 CodeBuild Role – Permissions to:

    1)Pull source from GitHub.
    2)Push images to ECR (ecr:PutImage, ecr:BatchCheckLayerAvailability).
    3)Authenticate to ECR (ecr:GetAuthorizationToken).

ECS Task Execution Role – Permissions to:
      1)Pull images from ECR.
      2)Write logs to CloudWatch.
      
odePipeline Role – Permissions to:
      1)Trigger CodeBuild.
      2)Update ECS service (ecs:UpdateService).

Challenges Faced
 
  1)Task stuck in PENDING due to incorrect subnet or security group settings.

   2)YAML_FILE_ERROR in CodeBuild caused by incorrect indentation in buildspec.yml.
   3)Deployment timeout when old ECS tasks did not stop within the pipeline timeout period.


   <img width="1001" height="432" alt="image" src="https://github.com/user-attachments/assets/16dc8782-a602-4ade-92b1-ea6e7e6f9217" />


   <img width="745" height="395" alt="image" src="https://github.com/user-attachments/assets/fef4dc67-0cc7-4714-89b1-b7b0a15bb974" />



   4)IAM role misconfiguration preventing ECS from pulling images from ECR.

   website LInk:http://suryasblog.online/ 


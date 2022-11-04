
<p>The readme file is in progress</p>
<h1> Socka-players </h1>
<p> A simple application written in Js and used MySQL for the database . This application can store the details of a football player along with an image. This project mainy focuses on the devops part rather than the development part . I used Docker for containerizing , Kubernetes for Orchestration , CircleCI for cicd , Terraform for provisioning clusters and servers in azure.</p>

<h2> Stages</h2>
<ul>
  <li>Containerization of the application using Docker</li>
  <li> Building a CI/CD pipeline to build and push the docker image </li>
  <li> Writing yaml manifests for the deployment of the application using Kubernetes </li>
  <li> Provisioning the infrastructure using terraform to provision an AKS cluster in Azure( created multi enviornments too )</li>
  <li> Improving the CI/CD pipeline by writing a job to automate the IaC and deployment of the application to the AKS cluster </li>
  </ul>
<h2> tools</h2>
<ul>
  <li>Docker</li>
  <li>Kubernetes</li>
  <li>CircleCI</li>
  <li>Terraform</li>
  <li>Azure AKS</li>
  </ul>
<h2> WorkFlow </h2>
<img src="https://github.com/rghdrizzle/socka-players-devops/blob/main/workflow%20(2).png">
<h2>Containerzing the Application </h2>
<ul>
<li> The application is made with javascript(nodejs and express) and ejs , so for containerizing the application the base image has to be the nodejs image. As you can see from the Dockerfile we simply just created a working directory and copied the files into it and exposed it to a port</li>
<li> Now if this application was not a simple one , or huge in size , we can build it using multi-stage builds with different base images</li>
<li> After building the image , it was pushed to dockerhub( you can push it to any other registry service too eg. aws ECR)</li>
</ul>

<h2> Kubernetes </h2>
<ul>
<li> I am using kubernetes to scale this application and manage the containers . Since application consists of a database and a frontend , we will create deployment and service manifests for both the database and frontend</li>



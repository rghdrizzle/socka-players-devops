
[![CircleCI](https://circleci.com/gh/rghdrizzle/socka-players-devops.svg?style=shield)](https://app.circleci.com/pipelines/github/rghdrizzle/socka-players-devops)
<h1> Socka-players </h1>
<p> A simple application written in Js and used MySQL for the database . This application can store the details of a football player along with an image. This project mainy focuses on the devops part rather than the development part . I used Docker for containerizing , Kubernetes for Orchestration , CircleCI for cicd , Terraform for provisioning clusters and servers in azure.</p>

<h2> Stages</h2>
<ul>
  <li>Containerization of the application using Docker</li>
  <li> Building a CI/CD pipeline to build and push the docker image </li>
  <li> Writing yaml manifests for the deployment of the application using Kubernetes and managing networks and services </li>
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
<li> After building the image , it was pushed to dockerhub( you can push it to any other registry manager too eg. aws ECR , Nexus)</li>
</ul>

<h2> Kubernetes </h2>
<ul>
<li> I am using kubernetes to scale this application and manage the containers . Since application consists of a database and a frontend , we will create deployment and service manifests for both the database and frontend</li>
<li> The database pod has a persistent Volume to store and persist data for the application</li>
<li> To expose the frontend service to the internet I have used the type LoadBlancer which exposes the pod to the external world with a seperate external IP </li>
<li> If you want to run this application in your local system , you can simply download the <a href=https://github.com/rghdrizzle/socka-players-devops/tree/main/kubernetes>manifests</a> and then type</li>

```
kubectl apply -k .
```
(The docker images are stored in a public repo in the Hub). Also make sure to create a secret.yaml for the database since I did not upload my secret file here.)
 ( About the communication between the database and the application , the application uses the host path to communicate , now if we are testing the application in a local machine the hostpath will be the localhost but when we are running it in kubernetes , the hostpath will be the the database service since the service is the only way we can communicate to the database so we map the application pod to the database service so that the communication can take place .( Im just writing this since I was stuck on this issue for few hours when I was trying to figure out how communication between pods work .))
</ul>
<h2>CICD</h2>
<ul>
<li>For continous integration and deployment I used CircleCI . CircleCI is a great tool and I chose this tool because of its efficiency and its features.</li>
<li>A job has been created in the config to build and push the image whenever the job is been triggered</li>
<li> The docker job will only be triggered when a release has been made with a specific tag in the git repo , like if a person made changes to the application and done testing it , he simply has to make a release with a specific tag such as d.01 to trigger the pipeline to build and push the image to the registry</li>
<li> I created a container where it contains an azure cli , kubectl and terraform cli so I can use this as my base image in the pipeline while automating the processes of terraform and deployment of the the application to the aks cluster</li>
</ul>
<h2>Terraform</h2>
<ul>
<li>For automating the provision of the servers or virtual machines on a cloud provider such as azure or aws , we can automate it with IaC.</li>
<li>Used terrafrom to provision an AKS cluster with 2 nodes and automated the process of provisioning when they are changes to the terraform file through cicd with triggers .</li>
<li>Stored the tf state files in Terraform cloud so that the pipeline can access it for provisioing . The kubeconfig file for the aks cluster is stored as an environment variable ( used this article for leveraging <a href='https://support.circleci.com/hc/en-us/articles/360003540393?input_string=how+to+i+inject+an+environment+variable+using+the+api%3F'>base64 encoding</a>).</li>
</ul>

# Output
<img src=https://github.com/rghdrizzle/socka-players-devops/blob/main/Screenshot%20(65).png></img>
As you can see from the image the application is successfully deployed to AKS and it is working fine , you can see the football players details which I added.   

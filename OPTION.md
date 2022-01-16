# Deployment对象操作
     #创建deployment对象  
     kubectl run nginx-deployment --image=hub.atguigu.com/library/myapp:v1 --port=80 --replicas=1  # --image 是docker pull的镜像

     #扩容  
     kubectl scale --replicas=3 deployment/nginx-deployment  

     #为deployment创建service  
     # Create a service for an nginx deployment, which serves on port 80 and connects to the containers on port 8000.  
     kubectl expose deployment nginx-deployment --port=30000 --target-port=80

     #更改deployment的service的Type类型为NodePort贡外部访问
     kubectl edit svc nginx-deployment  #nginx-deployment：deployment对象名

     #查询deployment对象  
     kubectl get deployment  
     
     #查询rs对象  
     kubectl get rs  
     
     #查询pod对象  
     kubectl get pod -o wide  
     
     #查看service对象  
     kubectl get svc  
# Проект sharetribe

[Исходный проект ссылка](https://github.com/sharetribe/sharetribe)

## 1.Общие сведения

Infrastructure stak:

- Cloud: Azure cloud
- Kubernetes: AKS (2 cpu 8gb)
- Data base: Azure MySQL DB
- Container registry: ACR
- CI/CD: Azure DevOps
- Git: Azure Repos
- Monitoring: Azure Monitor


## 2.CI

CI часть пайплайна (stage: Build) заключается в использовании Docker для создания image и push его в Azure Container Registry. 

Для ускорения сборки image было принято решение проводить build на основе кастомного image на нем предустановлена необходимая часть ПО для работы приложения. Path: `config/docker/base_image/Dockerfile`. Настраеваемая часть для buld в CI pipline находится в Path: `config/docker/Dockerfile`.

Поясниние tags:
$(TAG)
$(ENV)
$(ENV_TAG)
$(ENV_VERSION)

## 3.CD

CD часть пайплайна (stage: Deploy) заключается в использовании Kubernetes для deploy container в AKS. Если уже есть запущенные containers, то происходит просто update

- `Kubernetes create Namespase` - создает Namespase `app-($branch(dev/prod))`
- `Kubernetes create memcached(cash)` - создает контенер с cash data для обмена данными между контейнерами и кеша сайта.
- `Kubernetes create ingress` - создает ingress для балансировки нагруски и позволяет использовать виртуальный хостинг с именем 
- `Kubernetes application apply` - создает conteners для самого сайта web, worker, shredder и service
- `Kubernetes application set` - Плавающее обновление контейнеров "www" развёртывания "frontend", обновление image 

## 4. Development/prodaction concept with branch

Development/Prodaction имеют разные доменные имена. CD pipline в Development branch разворачивает контейнеры и доменное имя с tag dev, так же используется tag development в container registry. Для prodaction действуют те же правила. Application dev и prod могут работать паралельно.

Pipline в development запускается по trigger с push и обновляет application. В Prodaction нельзя сделать push, обновление происходит только через pull reguest и происходит запуск pipline в Prodaction branch.

## 5. Monitoring Azure monitor 

Как система мониторинга использовался Azure monitor для AKS, можно получать данные о нахрузке на контейнеры и ноды, о памяти, нагрузке на процессор, количестве активных подов и другое.

Создан алерт оповещающий о прегрузке CPU про превышении значения 3% и 90%. Доступен просмотр нагрузки pod. Так же его логи.
insights->containers->omsagent-> pod -> галочка -> live events




### Rool back Data base 

Resurse group -> vm-db-mysql_group ->Restore Fastest restore point -> Set up rool back 


### Create service principal

[microsoft doc](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli)

### Set up prometheus grafana

https://techcommunity.microsoft.com/t5/apps-on-azure-blog/using-azure-kubernetes-service-with-grafana-and-prometheus/ba-p/3020459

https://shailender-choudhary.medium.com/monitor-azure-kubernetes-service-aks-with-prometheus-and-grafana-8e2fe64d1314

## Create ingress 

NAMESPACE=app-development
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx \
  --create-namespace \
  --namespace $NAMESPACE \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/healthz

## permissions to use azure devops with k8s

[Define resources in YAML](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/resources?view=azure-devops&tabs=schema#troubleshooting-authorization-for-a-yaml-pipeline)

[link 2](https://stackoverflow.com/questions/58285661/the-service-connection-does-not-exist-or-has-not-been-authorized-for-use)


## Data:
http://dev.awsops.ml
http://prod.awsops.ml

user: musabeksadullayev@gmail.com
pass: Pa$$w0rd

https://github.com/GeorgyPzk/ExadelProject
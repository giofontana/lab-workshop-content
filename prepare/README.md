```
<api-url>

user<x>,
<x> = id



oc new-project ocp-ops-workshop
oc process -f https://raw.githubusercontent.com/openshift-homeroom/workshop-spawner/master/templates/hosted-workshop-production.json --param SPAWNER_NAMESPACE=`oc project --short` --param CLUSTER_SUBDOMAIN=`oc get route -n openshift-console --no-headers | head -n 1 | awk '{print $2}' | cut -d'.' -f2-` --param WORKSHOP_NAME=openshift-ops-workshop --param WORKSHOP_IMAGE=quay.io/gfontana/workshop-ocp-ops:develop | oc apply -f -

## Permissions and Security

oc new-project rbac-exercise
oc new-app httpd --name=rbac-exercise

<x> = initial user id
<y> = <x> + 50 --> e.g. if x = 1 so y = 51

# Etherpad

oc new-project etherpad --display-name "OpenTLC Shared Etherpad"
oc new-app --template=postgresql-persistent --param POSTGRESQL_USER=ether --param POSTGRESQL_PASSWORD=ether --param POSTGRESQL_DATABASE=etherpad --param POSTGRESQL_VERSION=10 --param VOLUME_CAPACITY=10Gi --labels=app=etherpad_db
sleep 15
oc new-app -f https://raw.githubusercontent.com/wkulhanek/docker-openshift-etherpad/master/etherpad-template.yaml -p DB_TYPE=postgres -p DB_HOST=postgresql -p DB_PORT=5432 -p DB_DATABASE=etherpad -p DB_USER=ether -p DB_PASS=ether -p ETHERPAD_IMAGE=quay.io/wkulhanek/etherpad:1.8.4 -p ADMIN_PASSWORD=secret
```

#!/opt/homebrew/bin/python3

import yaml
import re
import json
import os

os.system('./gradlew clean build -x test')


with open("deployment.yaml") as f:
   y = yaml.safe_load(f)
   image = y['spec']['template']['spec']['containers'][0]['image']
   image = re.sub('\d(?!\d)', lambda x: str(int(x.group(0)) + 1), image)

   y['spec']['template']['spec']['containers'][0]['image'] = image

with open("deployment.yaml","w") as f:
      yaml.dump(y, f)

os.system("docker build -t "+image+" . ")

os.system("minikube image load "+image)

os.system("kubectl apply -f deployment.yaml")

os.system("kubectl apply -f service.yaml")

print('new version: '+y['spec']['template']['spec']['containers'][0]['image'])

token="111105519fa202398a040ffaa07a21ee68"
crumb=$(curl -u "admin:$token" -s 'http://jenkins.local:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
curl -u "admin:$token" -H "$crumb" -X POST http://jenkins.local:8080/job/ENV/build?delay=0sec
curl -u "admin:$token" -H "$crumb" -X POST http://jenkins.local:8080/job/ansible-job/buildWithParameters?Jenkins_msg=msg

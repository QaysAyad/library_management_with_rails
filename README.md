# README

After the docker file is deployed make sure to run 

```bash
rake db:create
rake db:migrate
rails restart
```
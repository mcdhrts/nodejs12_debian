# nodejs12_debian
A Debian Dockerfile with installed nodejs12

if you want to mount your own folder (for examlpe for scripts) you can mount 
```/opt/userscripts```

For Example:

```docker run -d --name nodejs12_debian -v /your/folder:/opt/userscripts mcdhrts/nodejs12_debian:latest```

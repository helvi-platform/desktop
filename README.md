Quick Start
-------------------------

Run the docker image and open port `6080`

```
docker run -it --rm -p 6080:80 -v /var/run/docker.sock:/var/run/docker.sock helvi/desktop
```

Browse http://127.0.0.1:6080/

# cloud9
A Dockerimage for building Cloud9 Instances for diffrent Projects
# docker cloud9
A simple blank cloud9 Container definition

it offers a VOLUME /workspace

## Use

```bash
docker run -v $PWD/workspace:/workspace cloud9
```

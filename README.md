# The Mentor Group
Teaching inner city youth machine learning as a foundation to inspire and generate minority wealth through viable career paths in the field of data science.

Initial setup instructions


### CPU setup for x86 on Windows

Step 1
```docker build -t <container name> . ``` < note the . after

If you get an authorized user from the docker pull cmd inside the container, try:

``docker logout```

...and then run it or pull again. As it is public repo you shouldn't need to login.

Step 2
Run the image, mount the volumes for Jupyter and app folder for your fav IDE, and finally the expose ports 8888 for Jupyter Notebook:

```winpty docker run --rm -it -v "${PWD}:/app" -p 8888:8888 -p 6006:6006 <container name>```

---------------------------------------------------

### GPU setup for x86 on Linux

Step 1
docker build -t <container name> . < note the . after

If you get an authorized user from the docker pull cmd inside the container, try:

```docker logout```

...and then run it or pull again. As it is public repo you shouldn't need to login.

Step 2
Run the image, mount the volumes for Jupyter and app folder for your fav IDE, and finally the expose ports 8888 for Jupyter Notebook:

```docker run --rm -it --runtime=nvidia --user $(id -u):$(id -g) --group-add container_user --group-add sudo -v "${PWD}:/app" -p 8888:8888 -p 6006:6006 <container name>```

## Creating a Python project development folder

### # Make the Python project folder
- `mkdir -p /workspace/Kubernetes-in-Action/roadtok8s/py/`

### Create a folder for our Python source code
- `mkdir -p /workspace/Kubernetes-in-Action/roadtok8s/py/src`

### Linux or macOS users
- `python3 -m venv venv`

### Activating a Python virtual environment
- linux or mac users
- `source venv/bin/activate`


### Installing Python packages

### With the virtual environment activated
$(venv) python --version

*Update pip*

- `python -m pip install --upgrade pip`

*Install FastAPI*

- `python -m pip install fastapi`


**Output**

```bash
gitpod /workspace/Kubernetes-in-Action/roadtok8s/py (main) $ python3 -m venv venv
gitpod /workspace/Kubernetes-in-Action/roadtok8s/py (main) $ source venv/bin/activate
activate       activate.csh   activate.fish  
gitpod /workspace/Kubernetes-in-Action/roadtok8s/py (main) $ source venv/bin/activate
(venv) gitpod /workspace/Kubernetes-in-Action/roadtok8s/py (main) $ source venv/bin/activate
(venv) gitpod /workspace/Kubernetes-in-Action/roadtok8s/py (main) $ python --version
Python 3.12.1
(venv) gitpod /workspace/Kubernetes-in-Action/roadtok8s/py (main) $ python -m pip install --upgrade pip
Requirement already satisfied: pip in ./venv/lib/python3.12/site-packages (23.2.1)
Collecting pip
  Obtaining dependency information for pip from https://files.pythonhosted.org/packages/15/aa/3f4c7bcee2057a76562a5b33ecbd199be08cdb4443a02e26bd2c3cf6fc39/pip-23.3.2-py3-none-any.whl.metadata
  Downloading pip-23.3.2-py3-none-any.whl.metadata (3.5 kB)
Downloading pip-23.3.2-py3-none-any.whl (2.1 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.1/2.1 MB 11.0 MB/s eta 0:00:00
Installing collected packages: pip
  Attempting uninstall: pip
    Found existing installation: pip 23.2.1
    Uninstalling pip-23.2.1:
      Successfully uninstalled pip-23.2.1
Successfully installed pip-23.3.2
(venv) gitpod /workspace/Kubernetes-in-Action/roadtok8s/py (main) $ python -m pip install fastapi
Collecting fastapi
  Downloading fastapi-0.109.0-py3-none-any.whl.metadata (24 kB)
Collecting pydantic!=1.8,!=1.8.1,!=2.0.0,!=2.0.1,!=2.1.0,<3.0.0,>=1.7.4 (from fastapi)
  Downloading pydantic-2.6.0-py3-none-any.whl.metadata (81 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 81.8/81.8 kB 1.9 MB/s eta 0:00:00
Collecting starlette<0.36.0,>=0.35.0 (from fastapi)
  Downloading starlette-0.35.1-py3-none-any.whl.metadata (5.8 kB)
Collecting typing-extensions>=4.8.0 (from fastapi)
  Downloading typing_extensions-4.9.0-py3-none-any.whl.metadata (3.0 kB)
Collecting annotated-types>=0.4.0 (from pydantic!=1.8,!=1.8.1,!=2.0.0,!=2.0.1,!=2.1.0,<3.0.0,>=1.7.4->fastapi)
  Downloading annotated_types-0.6.0-py3-none-any.whl.metadata (12 kB)
Collecting pydantic-core==2.16.1 (from pydantic!=1.8,!=1.8.1,!=2.0.0,!=2.0.1,!=2.1.0,<3.0.0,>=1.7.4->fastapi)
  Downloading pydantic_core-2.16.1-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (6.5 kB)
Collecting anyio<5,>=3.4.0 (from starlette<0.36.0,>=0.35.0->fastapi)
  Downloading anyio-4.2.0-py3-none-any.whl.metadata (4.6 kB)
Collecting idna>=2.8 (from anyio<5,>=3.4.0->starlette<0.36.0,>=0.35.0->fastapi)
  Downloading idna-3.6-py3-none-any.whl.metadata (9.9 kB)
Collecting sniffio>=1.1 (from anyio<5,>=3.4.0->starlette<0.36.0,>=0.35.0->fastapi)
  Downloading sniffio-1.3.0-py3-none-any.whl (10 kB)
Downloading fastapi-0.109.0-py3-none-any.whl (92 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 92.0/92.0 kB 7.9 MB/s eta 0:00:00
Downloading pydantic-2.6.0-py3-none-any.whl (394 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 394.2/394.2 kB 9.3 MB/s eta 0:00:00
Downloading pydantic_core-2.16.1-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (2.2 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.2/2.2 MB 27.9 MB/s eta 0:00:00
Downloading starlette-0.35.1-py3-none-any.whl (71 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 71.1/71.1 kB 22.4 MB/s eta 0:00:00
Downloading typing_extensions-4.9.0-py3-none-any.whl (32 kB)
Downloading annotated_types-0.6.0-py3-none-any.whl (12 kB)
Downloading anyio-4.2.0-py3-none-any.whl (85 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 85.5/85.5 kB 23.1 MB/s eta 0:00:00
Downloading idna-3.6-py3-none-any.whl (61 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 61.6/61.6 kB 17.2 MB/s eta 0:00:00
Installing collected packages: typing-extensions, sniffio, idna, annotated-types, pydantic-core, anyio, starlette, pydantic, fastapi
Successfully installed annotated-types-0.6.0 anyio-4.2.0 fastapi-0.109.0 idna-3.6 pydantic-2.6.0 pydantic-core-2.16.1 sniffio-1.3.0 starlette-0.35.1 typing-extensions-4.9.0
(venv) gitpod /workspace/Kubernetes-in-Action/roadtok8s/py (main) $ 
```


### FastAPI requirements.txt



```
fastapi
jinja2
uvicorn
gunicorn
```

### Installing all third-party packages

-  install all packages via the newly created requirements file
- `python -m pip install -r src/requirements.txt`


**Out-put**

```bash
(venv) gitpod /workspace/Kubernetes-in-Action/roadtok8s/py (main) $ python -m pip install -r src/requirements.txt
Requirement already satisfied: fastapi in ./venv/lib/python3.12/site-packages (from -r src/requirements.txt (line 1)) (0.109.0)
Collecting jinja2 (from -r src/requirements.txt (line 2))
  Downloading Jinja2-3.1.3-py3-none-any.whl.metadata (3.3 kB)
Collecting uvicorn (from -r src/requirements.txt (line 3))
  Downloading uvicorn-0.27.0.post1-py3-none-any.whl.metadata (6.4 kB)
Collecting gunicorn (from -r src/requirements.txt (line 4))
  Downloading gunicorn-21.2.0-py3-none-any.whl.metadata (4.1 kB)
Requirement already satisfied: pydantic!=1.8,!=1.8.1,!=2.0.0,!=2.0.1,!=2.1.0,<3.0.0,>=1.7.4 in ./venv/lib/python3.12/site-packages (from fastapi->-r src/requirements.txt (line 1)) (2.6.0)
Requirement already satisfied: starlette<0.36.0,>=0.35.0 in ./venv/lib/python3.12/site-packages (from fastapi->-r src/requirements.txt (line 1)) (0.35.1)
Requirement already satisfied: typing-extensions>=4.8.0 in ./venv/lib/python3.12/site-packages (from fastapi->-r src/requirements.txt (line 1)) (4.9.0)
Collecting MarkupSafe>=2.0 (from jinja2->-r src/requirements.txt (line 2))
  Downloading MarkupSafe-2.1.4-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (3.0 kB)
Collecting click>=7.0 (from uvicorn->-r src/requirements.txt (line 3))
  Downloading click-8.1.7-py3-none-any.whl.metadata (3.0 kB)
Collecting h11>=0.8 (from uvicorn->-r src/requirements.txt (line 3))
  Downloading h11-0.14.0-py3-none-any.whl (58 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 58.3/58.3 kB 1.3 MB/s eta 0:00:00
Collecting packaging (from gunicorn->-r src/requirements.txt (line 4))
  Downloading packaging-23.2-py3-none-any.whl.metadata (3.2 kB)
Requirement already satisfied: annotated-types>=0.4.0 in ./venv/lib/python3.12/site-packages (from pydantic!=1.8,!=1.8.1,!=2.0.0,!=2.0.1,!=2.1.0,<3.0.0,>=1.7.4->fastapi->-r src/requirements.txt (line 1)) (0.6.0)
Requirement already satisfied: pydantic-core==2.16.1 in ./venv/lib/python3.12/site-packages (from pydantic!=1.8,!=1.8.1,!=2.0.0,!=2.0.1,!=2.1.0,<3.0.0,>=1.7.4->fastapi->-r src/requirements.txt (line 1)) (2.16.1)
Requirement already satisfied: anyio<5,>=3.4.0 in ./venv/lib/python3.12/site-packages (from starlette<0.36.0,>=0.35.0->fastapi->-r src/requirements.txt (line 1)) (4.2.0)
Requirement already satisfied: idna>=2.8 in ./venv/lib/python3.12/site-packages (from anyio<5,>=3.4.0->starlette<0.36.0,>=0.35.0->fastapi->-r src/requirements.txt (line 1)) (3.6)
Requirement already satisfied: sniffio>=1.1 in ./venv/lib/python3.12/site-packages (from anyio<5,>=3.4.0->starlette<0.36.0,>=0.35.0->fastapi->-r src/requirements.txt (line 1)) (1.3.0)
Downloading Jinja2-3.1.3-py3-none-any.whl (133 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 133.2/133.2 kB 3.3 MB/s eta 0:00:00
Downloading uvicorn-0.27.0.post1-py3-none-any.whl (60 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 60.7/60.7 kB 18.6 MB/s eta 0:00:00
Downloading gunicorn-21.2.0-py3-none-any.whl (80 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 80.2/80.2 kB 18.5 MB/s eta 0:00:00
Downloading click-8.1.7-py3-none-any.whl (97 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 97.9/97.9 kB 15.8 MB/s eta 0:00:00
Downloading MarkupSafe-2.1.4-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (28 kB)
Downloading packaging-23.2-py3-none-any.whl (53 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 53.0/53.0 kB 13.1 MB/s eta 0:00:00
Installing collected packages: packaging, MarkupSafe, h11, click, uvicorn, jinja2, gunicorn
Successfully installed MarkupSafe-2.1.4 click-8.1.7 gunicorn-21.2.0 h11-0.14.0 jinja2-3.1.3 packaging-23.2 uvicorn-0.27.0.post1
(venv) gitpod /workspace/Kubernetes-in-Action/roadtok8s/py (main) $ 
```
### Creating src/main.py

```# Import the FastAPI class from the fastapi module.
from fastapi import FastAPI
# Declare an instance of the FastAPI class.
app = FastAPI()
# use the app instance as a decorator to handle an
# HTTP route and HTTP method.
@app.get("/")
def read_index():
"""
Return a Python Dictionary that supports JSON serialization.
"""
return {"Hello": "World"}
```


### Starting FastAPI with uvicorn
`uvicorn src.main:app --reload --port 8011`
## Handling multiple routes with FastAPI

### Adding a new route in src/main.py
`http://127.0.0.1:8011/api/v1/hello-world/`

**Output**

```bash
(venv) gitpod /workspace/Kubernetes-in-Action/roadtok8s/py (main) $ uvicorn src.main:app --reload --port 8011
INFO:     Will watch for changes in these directories: ['/workspace/Kubernetes-in-Action/roadtok8s/py']
INFO:     Uvicorn running on http://127.0.0.1:8011 (Press CTRL+C to quit)
INFO:     Started reloader process [5628] using StatReload
INFO:     Started server process [5630]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
INFO:     27.122.12.138:0 - "GET / HTTP/1.1" 200 OK
INFO:     27.122.12.138:0 - "GET / HTTP/1.1" 200 OK
INFO:     27.122.12.138:0 - "GET /api/v1/hello-world HTTP/1.1" 307 Temporary Redirect
INFO:     27.122.12.138:0 - "GET /api/v1/hello-world/ HTTP/1.1" 200 OK
```


### Creating a folder for this chapter’s JavaScript code

`/workspace/Kubernetes-in-Action/roadtok8s/js`
### Initializing a new Node.js project

`npm init`

```bash
(venv) gitpod /workspace/Kubernetes-in-Action/roadtok8s/js (main) $ cat package.json 
{
  "name": "js",
  "version": "1.0.0",
  "description": "\"\",",
  "main": "index.js",
  "scripts": {
    "test": "\"test\": \"echo \\\"Error: no test specified\\\" && exit 1\""
  },
  "author": "",
  "license": "ISC"
}
(venv) gitpod /workspace/Kubernetes-in-Action/roadtok8s/js (main) $ 
```

### Installing Express.js
`npm install express`



¡	node_modules/—Contains all of our third-party packages. Treat this as a folder
you can delete anytime and reinstall with npm install.
¡	package-lock.json—This is an auto-generated file from package.json with
more detailed information about our project.
¡	package.json—Contains the versions of all of the third-party packages installed,
our package (or project) name, our package’s version, and any custom scripts we
may add.



### Express.js HTTP handling

```app.<httpMethod>(<pathString>, <callback>)
¡	<httpMethod>—This is the HTTP method that will be handled by the corresponding callback function. In main.js, this is simply the GET method.
¡	<pathString>—This is a string that represents the URL path that will be handled
by the corresponding callback function. In listing 2.17, we only handle the index
route (/).
¡	<callback>—This is another function that will be called when an HTTP request
is made to the corresponding URL path (e.g., /).```


### Run the Node.js + Express.js app



*Running the Express.js web server*

`node main.js`




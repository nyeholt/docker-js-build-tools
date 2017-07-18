# JS build tools

Ubuntu based (for convenience...)

Contains the following tools for project builds

* NVM
* NPM 6.5.0
* Grunt
* Yarn
* Brunch

# Usage

Build an image - `docker build -t "symbiote/jsbuild" .`


Start a new container in the project directory you're wanting to execute 
the command in. This binds the current directory as a volume in the image, and 
sets it as the work directory, making it the context for the build command that
gets executed

`docker run -it -v $(pwd):/tmp/work -w /tmp/work --name jsbuild --rm symbiote/jsbuild yarn start`

## Drawbacks

Image doesn't currently handle execution as the 'current' user which means 
artefacts of the build command get created as "root:root", needing a chown
from the host after-the-fact. 

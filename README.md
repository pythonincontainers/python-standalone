# python-standalone
Multi-stage Build for Standalone "cython" &amp; gcc compiled binary

Multi-stage Dockerfile copies "standalone.py" source file from Context.
Cython assumes Python3 with "-3".

Second stage uses Debian Slim image with ***python-dev*** and ***python3-dev*** libraries.

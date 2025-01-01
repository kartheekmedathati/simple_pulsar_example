# Install a supported version of Python if you haven't already
pyenv install 3.10.x  # Replace x with the latest minor version

# Create a virtual environment
pyenv virtualenv 3.10.x pulsar-env
pyenv activate pulsar-env

# Now install pulsar-client
pip install 'pulsar-client'


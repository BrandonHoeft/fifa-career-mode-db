# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the dependencies file to the working directory
COPY streamlit_app/requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /usr/src/app
COPY streamlit_app/ .

# Make port 8501 available to the world outside this container
EXPOSE 8501

# Set environment variable
ENV PYTHONPATH "${PYTHONPATH}:/usr/src/app"

# Run app.py when the container launches
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
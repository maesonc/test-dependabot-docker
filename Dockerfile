# Use the official MongoDB image as the base
FROM mongo:8.0.3
# Set the environment variable to define the custom data directory inside the container
ENV MONGO_DATA_DIR /db-data
# Create the custom data directory inside the container
RUN mkdir -p $MONGO_DATA_DIR
# Set the ownership and permissions for the data directory
RUN chown -R mongodb:mongodb $MONGO_DATA_DIR
RUN chmod -R 755 $MONGO_DATA_DIR
USER mongodb
# Start MongoDB with the custom data directory
CMD ["mongod", "--dbpath", "/db-data"]

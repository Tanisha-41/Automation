#!/bin/bash

# Function to scale down Airflow 1 components
scale_down_airflow1() {
    echo "Scaling down Airflow1 components..."
    kubectl scale deployment airflow-scheduler --replicas=0 -n spark
    kubectl scale deployment airflow-statsd --replicas=0 -n spark
    kubectl scale deployment airflow-triggerer --replicas=0 -n spark
    kubectl scale deployment airflow-webserver --replicas=0 -n spark
}

# Function to scale up Airflow 1 components
scale_up_airflow1() {
    echo "Scaling up Airflow1 components..."
    kubectl scale deployment airflow-scheduler --replicas=1 -n spark
    kubectl scale deployment airflow-statsd --replicas=1 -n spark
    kubectl scale deployment airflow-triggerer --replicas=1 -n spark
    kubectl scale deployment airflow-webserver --replicas=1 -n spark
}

# Function to scale down Airflow 2 components
scale_down_airflow2() {
    echo "Scaling down Airflow2 components..."
    kubectl scale deployment airflow2-scheduler --replicas=0 -n spark
    kubectl scale deployment airflow2-statsd --replicas=0 -n spark
    kubectl scale deployment airflow2-triggerer --replicas=0 -n spark
    kubectl scale deployment airflow2-webserver --replicas=0 -n spark
}

# Function to scale up Airflow 2 components
scale_up_airflow2() {
    echo "Scaling up Airflow2 components..."
    kubectl scale deployment airflow2-scheduler --replicas=1 -n spark
    kubectl scale deployment airflow2-statsd --replicas=1 -n spark
    kubectl scale deployment airflow2-triggerer --replicas=1 -n spark
    kubectl scale deployment airflow2-webserver --replicas=1 -n spark
}

# Function to scale down Airflow 3 components
scale_down_airflow3() {
    echo "Scaling down Airflow3 components..."
    kubectl scale deployment airflow3-scheduler --replicas=0 -n spark
    kubectl scale deployment airflow3-statsd --replicas=0 -n spark
    kubectl scale deployment airflow3-triggerer --replicas=0 -n spark
    kubectl scale deployment airflow3-webserver --replicas=0 -n spark
}

# Function to scale up Airflow 3 components
scale_up_airflow3() {
    echo "Scaling up Airflow3 components..."
    kubectl scale deployment airflow3-scheduler --replicas=1 -n spark
    kubectl scale deployment airflow3-statsd --replicas=1 -n spark
    kubectl scale deployment airflow3-triggerer --replicas=1 -n spark
    kubectl scale deployment airflow3-webserver --replicas=1 -n spark
}

# Function to scale down Airflow 4 components
scale_down_airflow4() {
    echo "Scaling down Airflow4 components..."
    kubectl scale deployment airflow4-scheduler --replicas=0 -n spark
    kubectl scale deployment airflow4-statsd --replicas=0 -n spark
    kubectl scale deployment airflow4-triggerer --replicas=0 -n spark
    kubectl scale deployment airflow4-webserver --replicas=0 -n spark
}

# Function to scale up Airflow 4 components
scale_up_airflow4() {
    echo "Scaling up Airflow4 components..."
    kubectl scale deployment airflow4-scheduler --replicas=1 -n spark
    kubectl scale deployment airflow4-statsd --replicas=1 -n spark
    kubectl scale deployment airflow4-triggerer --replicas=1 -n spark
    kubectl scale deployment airflow4-webserver --replicas=1 -n spark
}

# Main logic to scale down or up based on input environment and action
if [ "$1" == "down" ]; then
    if [ "$2" == "airflow1" ]; then
        scale_down_airflow1
    elif [ "$2" == "airflow2" ]; then
        scale_down_airflow2
    elif [ "$2" == "airflow3" ]; then
        scale_down_airflow3
    elif [ "$2" == "airflow4" ]; then
        scale_down_airflow4
    else
        echo "Invalid Airflow environment. Use 'airflow1', 'airflow2', 'airflow3', or 'airflow4'."
    fi
elif [ "$1" == "up" ]; then
    if [ "$2" == "airflow1" ]; then
        scale_up_airflow1
    elif [ "$2" == "airflow2" ]; then
        scale_up_airflow2
    elif [ "$2" == "airflow3" ]; then
        scale_up_airflow3
    elif [ "$2" == "airflow4" ]; then
        scale_up_airflow4
    else
        echo "Invalid Airflow environment. Use 'airflow1', 'airflow2', 'airflow3', or 'airflow4'."
    fi
else
    echo "Usage: $0 {up|down} {airflow1|airflow2|airflow3|airflow4}"
fi


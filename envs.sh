#!/bin/bash

# Function to scale down applications for dev environment
scale_down_dev() {
    echo "Scaling down dev applications..."

    # Group 1: loopbackdev, reactdev
    kubectl scale deployment loopbackdev-deployment --replicas=0 -n spark
    kubectl scale deployment reactdev-deployment --replicas=0 -n spark
}

# Function to scale up applications for dev environment
scale_up_dev() {
    echo "Scaling up dev applications..."

    # Group 1: loopbackdev, reactdev
    kubectl scale deployment loopbackdev-deployment --replicas=1 -n spark
    kubectl scale deployment reactdev-deployment --replicas=1 -n spark
}

# Function to scale down applications for test environment
scale_down_int() {
    echo "Scaling down test applications..."

    # Group 2: loopbackint, reactint
    kubectl scale deployment loopbackint-deployment --replicas=0 -n spark
    kubectl scale deployment reactint-deployment --replicas=0 -n spark
}

# Function to scale up applications for test environment
scale_up_int() {
    echo "Scaling up test applications..."

    # Group 2: loopbackint, reactint
    kubectl scale deployment loopbackint-deployment --replicas=1 -n spark
    kubectl scale deployment reactint-deployment --replicas=1 -n spark
}

# Function to scale down applications for int environment
scale_down_test() {
    echo "Scaling down int applications..."

    # Group 3: fastbacktest, reactsep-deployment
    kubectl scale deployment fastback-test --replicas=0 -n spark
    kubectl scale deployment reactsep-deployment --replicas=0 -n spark
}

# Function to scale up applications for int environment
scale_up_test() {
    echo "Scaling up int applications..."

    # Group 3: fastbacktest, reactsep-deployment
    kubectl scale deployment fastback-test --replicas=1 -n spark
    kubectl scale deployment reactsep-deployment --replicas=1 -n spark
}

# Function to scale down applications for main environment
scale_down_main() {
    echo "Scaling down main applications..."

    # Group 4: loopback-deployment, react-deployment
    kubectl scale deployment loopback-deployment --replicas=0 -n spark
    kubectl scale deployment react-deployment --replicas=0 -n spark
}

# Function to scale up applications for main environment
scale_up_main() {
    echo "Scaling up main applications..."

    # Group 4: loopback-deployment, react-deployment
    kubectl scale deployment loopback-deployment --replicas=1 -n spark
    kubectl scale deployment react-deployment --replicas=1 -n spark
}

# Main logic based on environment and action
if [ "$1" == "dev" ]; then
    if [ "$2" == "down" ]; then
        scale_down_dev
    elif [ "$2" == "up" ]; then
        scale_up_dev
    else
        echo "Invalid action. Use 'up' or 'down'."
    fi
elif [ "$1" == "test" ]; then
    if [ "$2" == "down" ]; then
        scale_down_test
    elif [ "$2" == "up" ]; then
        scale_up_test
    else
        echo "Invalid action. Use 'up' or 'down'."
    fi
elif [ "$1" == "int" ]; then
    if [ "$2" == "down" ]; then
        scale_down_int
    elif [ "$2" == "up" ]; then
        scale_up_int
    else
        echo "Invalid action. Use 'up' or 'down'."
    fi
elif [ "$1" == "main" ]; then
    if [ "$2" == "down" ]; then
        scale_down_main
    elif [ "$2" == "up" ]; then
        scale_up_main
    else
        echo "Invalid action. Use 'up' or 'down'."
    fi
else
    echo "Invalid environment. Use 'dev', 'test', 'int', or 'main'."
fi


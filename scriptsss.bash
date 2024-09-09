

GREEN="\033[32m"
RED="\033[31m"
YELLOW="\033[33m"
NC="\033[0m" 

check_command() {
    command_name=$1
    version_flag=$2
    package_name=$3

    echo -e "${YELLOW}Checking for $package_name...${NC}"

    if command -v "$command_name" &> /dev/null
    then
        version=$($command_name $version_flag)
        echo -e "${GREEN}$package_name is installed: ${version}${NC}"
    else
        echo -e "${RED}$package_name is not installed.${NC}"
        echo -e "${YELLOW}To install $package_name, please run:${NC}"
        case "$command_name" in
            jupyter)
                echo "  pip install jupyterlab"
                ;;
            python)
                echo "  sudo apt install python3 (for Linux)"
                echo "  brew install python3 (for Mac)"
                ;;
            java)
                echo "  sudo apt install default-jdk (for Linux)"
                echo "  brew install java (for Mac)"
                ;;
            *)
                echo "  Use your package manager to install $package_name."
                ;;
        esac
    fi
    echo ""
}

# Check for Python
check_command "python3" "--version" "Python"

# Check for Jupyter
check_command "jupyter" "--version" "Jupyter"

# Check for Jupyter Kernels
check_jupyter_kernels() {
    if command -v jupyter &> /dev/null
    then
        echo -e "${YELLOW}Checking Jupyter kernels...${NC}"
        kernels=$(jupyter kernelspec list 2>/dev/null)
        if [ -n "$kernels" ]; then
            echo -e "${GREEN}Jupyter kernels installed:${NC}"
            echo "$kernels"
        else
            echo -e "${RED}No Jupyter kernels installed.${NC}"
        fi
    fi
}

check_jupyter_kernels

check_command "java" "-version" "Java"

check_command "pip3" "--version" "Pip"

check_command "node" "--version" "Node.js (for Jupyter extensions)"

echo -e "${GREEN}System check completed.${NC}"
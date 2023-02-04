#!/bin/bash

installed_file="installed.txt"

# Function to list installed packages
list_installed_packages() {
  echo "Installed packages:"
  while read -r package; do
    echo "  - $package"
  done < $installed_file
}

# Function to install a package
install_package() {
  package=$1
  if grep -q "$package" $installed_file; then
    echo "$package is already installed."
  else
    read -p "Do you want to install $package? [Y/n] " confirm
    if [[ "$confirm" == "Y" || "$confirm" == "y" || -z "$confirm" ]]; then
      echo "Installing $package..."
      echo "$package" >> $installed_file
      echo "$package has been installed."
    else
      echo "Installation cancelled."
    fi
  fi
}

# Function to uninstall a package
uninstall_package() {
  package=$1
  if grep -q "$package" $installed_file; then
    read -p "Do you want to uninstall $package? [Y/n] " confirm
    if [[ "$confirm" == "Y" || "$confirm" == "y" || -z "$confirm" ]]; then
      echo "Uninstalling $package..."
      sed -i "/$package/d" $installed_file
      echo "$package has been uninstalled."
    else
      echo "Uninstallation cancelled."
    fi
  else
    echo "$package is not installed."
  fi
}

# Function to add a repository
add_repo() {
  repo=$1
  if grep -q "$repo" repos.txt; then
    echo "Repository $repo is already added."
  else
    echo "Adding repository $repo..."
    echo "$repo" >> repos.txt
    echo "Repository $repo has been added."
  fi
}

# Function to remove a repository
remove_repo() {
  repo=$1
  if grep -q "$repo" repos.txt; then
    echo "Removing repository $repo..."
    sed -i "\\|$repo|d" repos.txt
    echo "Repository $repo has been removed."
  else
    echo "Repository $repo not found."
  fi
}

# Function to list repositories
list_repos() {
  if [ -f repos.txt ]; then
    echo "List of repositories:"
    cat repos.txt
  else
    echo "No repositories found."
  fi
}

# Function to show the help menu
show_help() {
  echo "
  Package Manager Help Menu:
  install [package_name] - Installs the specified package
  uninstall [package_name] - Uninstalls the package at the specified package in the list of installed packages
  list - Lists all installed packages
  help - Shows this help menu
  exit - Exits the Package Manager
  "
}

#about this project
about() {

  echo "About this project"
  sleep 2
  echo "(: Mamo v1.0.9 Beta :)"
  echo "made by love @Andrew_thecoding12"
  sleep 2
  echo "this project was made by me and Chatgpt helps to improve this project code"
}


#Show menu
while true; do
  echo "
  Package Manager Menu:
  1. List installed packages
  2. Install a package
  3. Uninstall a package
  4. add a repository 
  5. Remove a repository 
  6. listing all the repostories
  7. help
  8. about
  9. exit
  "
  read -p "Enter your choice [1-8]: " choice

  case $choice in
    1) list_installed_packages;;
    2) read -p "Enter package name to install: " package
       install_package $package;;
    3) read -p "Enter package name to uninstall: " package
       uninstall_package $package;;
    4) read -p "Enter repository URL to add: " repo
       add_repo $repo;;
    5) read -p "Enter repository URL to remove: " repo
       remove_repo $repo;;
    6) list_repos;;
    7) show_help;;
    8) about;;
    9) break;;
    *) echo "Invalid choice, try again.";;
  esac
done

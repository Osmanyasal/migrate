#!/bin/bash

# Get the list of installed packages
packages=$(dpkg --get-selections | grep -v deinstall | cut -f1)

# Get the list of software sources (repositories)
repositories=$(grep -r '^deb' /etc/apt/sources.list /etc/apt/sources.list.d/ | cut -d' ' -f2-)

# Create the installation script
echo "#!/bin/bash" > install_packages.sh
echo "sudo apt update" >> install_packages.sh

# Loop through the repositories and append the commands to add them to the script
while IFS= read -r repository; do
    echo "sudo add-apt-repository -y $repository" >> install_packages.sh
done <<< "$repositories"

# Add an additional update command to refresh package lists after adding repositories
echo "sudo apt update" >> install_packages.sh

# Loop through the packages and append installation commands to the script
for package in $packages; do
    echo "sudo apt install -y $package" >> install_packages.sh
done

# Make the script executable
chmod +x install_packages.sh

echo "Installation script 'install_packages.sh' created successfully."

